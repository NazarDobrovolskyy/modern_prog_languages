# YouTube Video Title Extractor in Go

## Overview

This Go program is designed to extract the title of a YouTube video by making an HTTP request to the specified YouTube link and parsing the HTML response. The extraction is performed using the `goquery` library, which simplifies HTML parsing in Go.

## Code Details

- The main logic of the program is encapsulated in the `getVideoTitle` function, which takes a YouTube link as a parameter and returns the extracted video title along with any potential errors.

- The `http` package is used to send an HTTP GET request to the provided YouTube link.

- The `goquery` package is employed to parse the HTML content of the YouTube page. Specifically, the program selects the content of the `<title>` tag, which typically contains the video title.

- The extracted title is then cleaned by removing trailing whitespaces and the common " - YouTube" suffix, providing a cleaner representation of the actual video title.

- The `main` function showcases an example usage of the `getVideoTitle` function, where a YouTube link is specified, and the extracted title is printed to the console.

1. **Install Dependencies:**
   Make sure to install the `goquery` package by running the following command in your terminal:
   ```bash
   go get github.com/PuerkitoBio/goquery

2. **Run:**
   ```go run main.go```
