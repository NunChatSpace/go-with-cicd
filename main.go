package main

import "github.com/NunChatSpace/go-with-cicd/http"

func main() {
	http.GetServer().Run(":8080")
}
