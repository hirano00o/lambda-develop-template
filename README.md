# lambda-go-develop-template

This repository is template to develop AWS Lambda that assumed to use ECR.

## How to use this repository

1. Select `Use this template` button on this repository and create your repository.
2. The code is under the `src` directory.
   1. As a sample, there is `lambda-go-develop-template` which returns `{"Message":"Hello world"}`.
3. You need to download the runtime interface emulator(RIE) to `~/.aws-lambda-rie/aws-lambda-rie`.
   1. See `To test locally without adding RIE to the image` on https://docs.aws.amazon.com/lambda/latest/dg/go-image.html .
4. After you create the lambda, you can build and run using `make build` and `make run`. Please freely rewrite `functionName` of `Makefile`. You can stop using `make stop`.
   1. If you build and run the template, you can call `Hello world` with following command.
       ```
       $ curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
       ```
