package main

import (
	"context"

	"github.com/aws/aws-lambda-go/lambda"

	"github.com/hirano00o/lambda-go-develop-template/src/lambda-go-develop-template/greeting"
)

type Response struct {
	Message string `json:"Message"`
}

func handleFunctions(ctx context.Context) (Response, error) {
	message, err := greeting.Hello(ctx)

	return Response{Message: message}, err
}

func main() {
	lambda.Start(handleFunctions)
}
