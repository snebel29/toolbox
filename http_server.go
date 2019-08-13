package main

import (
	"flag"
	"log"
	"net/http"
)

// This is a simple http stub server to return files from a directory 
func main() {
	port := flag.String("p", "6666", "port to serve on")
	directory := flag.String("d", ".", "the directory of static file to host")
	flag.Parse()

	http.Handle("/", http.FileServer(http.Dir(*directory)))

	log.Printf("Serving %s on HTTP port: %s\n", *directory, *port)
	log.Fatal(http.ListenAndServe(":"+*port, nil))
}
