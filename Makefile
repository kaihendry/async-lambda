STACK = asyncB
PROFILE = mine
VERSION = "0.1"

.PHONY: build deploy validate destroy

deploy:
	sam build
	AWS_PROFILE=$(PROFILE) sam deploy --resolve-s3 --stack-name $(STACK) --no-confirm-changeset --no-fail-on-empty-changeset --capabilities CAPABILITY_IAM

validate:
	AWS_PROFILE=$(PROFILE) sam validate

destroy:
	AWS_PROFILE=$(PROFILE) aws cloudformation delete-stack --stack-name $(STACK)

local:
	sam build
	sam local invoke helloFromLambdaFunction

tail:
	AWS_PROFILE=$(PROFILE) sam logs -n helloFromLambdaFunction --stack-name $(STACK) --tail
