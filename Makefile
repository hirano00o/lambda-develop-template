rieFileName = aws-lambda-rie
rieDefaultPath = $${HOME}/.aws-lambda-rie
useRiePath = ""
functionName = hellofunction

.PHONY: existRie build run

existRie:
	$(if $(shell find ${rieDefaultPath}/${rieFileName} 2> /dev/null), $(eval useRiePath := ${rieDefaultPath}))
	$(if $(shell find ./${rieFileName} 2> /dev/null), $(eval useRiePath := /$(shell pwd)))
	@if [ -z "${useRiePath}" ] ; then @echo "download aws-lambda-rie file, see README.md"; exit 1; fi

build:
	@docker build -t ${functionName} src/lambda-go-develop-template/

run: existRie
	@docker run -d --rm -v ${useRiePath}:/aws-lambda --entrypoint /aws-lambda/aws-lambda-rie -p 9000:8080 --name lambda-main ${functionName}:latest /main

stop:
	@docker stop lambda-main
