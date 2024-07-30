package main

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"os"
	"strconv"
	"sync"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb/types"
	"github.com/google/uuid"
)

const tableName = "stream-pipe"

const numWorkers = 30

func main() {
	if len(os.Args) != 2 {
		log.Fatalf("Usage: %s <number of records>\n", os.Args[0])
	}

	numRecords, err := strconv.Atoi(os.Args[1])
	if err != nil {
		log.Fatalf("Invalid number of records: %s\n", os.Args[1])
	}

	cfg, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion("us-east-1"))
	if err != nil {
		log.Fatalf("unable to load SDK config, %v", err)
	}

	svc := dynamodb.NewFromConfig(cfg)

	rand.Seed(time.Now().UnixNano())

	// Criando um channel pra enviar os ID's para os workers
	ids := make(chan string, numRecords)

	// Waitgroup pra aguardar os workers finalizarem
	var wg sync.WaitGroup

	// Iniciando os workers
	for i := 0; i < numWorkers; i++ {
		wg.Add(1)
		go worker(i, &wg, svc, ids)
	}

	// Enviando os ID's para o channel para consumo dos workers
	for i := 0; i < numRecords; i++ {
		id := uuid.New().String()
		ids <- id
	}

	// Fechando os channels
	close(ids)
	wg.Wait()

	fmt.Printf("Successfully inserted %d records into %s\n", numRecords, tableName)
}

func worker(workerId int, wg *sync.WaitGroup, svc *dynamodb.Client, ids <-chan string) {
	defer wg.Done()

	for id := range ids {
		fmt.Println("Worker:", workerId, id)
		err := putItem(svc, id)
		if err != nil {
			log.Printf("Worker %d: Failed to put item %s: %v\n", workerId, id, err)
		}
	}
}

func putItem(svc *dynamodb.Client, id string) error {
	input := &dynamodb.PutItemInput{
		TableName: aws.String(tableName),
		Item: map[string]types.AttributeValue{
			"id": &types.AttributeValueMemberS{Value: id},
		},
	}

	_, err := svc.PutItem(context.TODO(), input)
	return err
}
