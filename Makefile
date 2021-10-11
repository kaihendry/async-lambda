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
	sam local invoke waitFunction

tail:
	AWS_PROFILE=$(PROFILE) sam logs -n waitFunction --stack-name $(STACK) --tail
