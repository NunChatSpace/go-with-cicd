prep:
	go mod tidy

build:
	go build -o go-with-cicd

test:
	echo "test file"

serve:
	go run main.go