package main

import (
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

func getVideoTitle(youtubeLink string) (string, error) {
	response, err := http.Get(youtubeLink)
	if err != nil {
		return "", err
	}
	defer response.Body.Close()

	document, err := goquery.NewDocumentFromReader(response.Body)
	if err != nil {
		return "", err
	}

	title := document.Find("title").Text()
	// Extract the actual video title from the full title (which may include other information)
	videoTitle := strings.TrimSuffix(strings.TrimSpace(title), " - YouTube")

	return videoTitle, nil
}

func main() {
	youtubeLink := "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"

	videoTitle, err := getVideoTitle(youtubeLink)
	if err != nil {
		log.Fatal("Error:", err)
	}

	fmt.Println("Video Title:", videoTitle)
}
