package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"os"
)

func main() {
	http_proxy := os.Getenv("HTTP_PROXY")
	https_proxy := os.Getenv("HTTPS_PROXY")

	if http_proxy == "" || https_proxy == "" {
		proxyUrl, _ := url.Parse("http://127.0.0.1:8888")
		http.DefaultTransport = &http.Transport{Proxy: http.ProxyURL(proxyUrl)}
		fmt.Println("Override default transport and setting proxy.")
	} else {
		fmt.Println("Proxy defined in env, skipping override.")
	}

	// lifted from net/http get example https://golang.org/pkg/net/http/#example_Get
	res, err := http.Get("http://www.google.com/robots.txt")
	if err != nil {
		log.Fatal(err)
	}
	robots, err := ioutil.ReadAll(res.Body)
	res.Body.Close()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s", robots)
}

