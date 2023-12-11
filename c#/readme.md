# YouTube Video Title Extractor - C# Program
## Overview:
The YouTube Video Title Extractor is a C# program designed to retrieve the title of a YouTube video by directly scraping the HTML content of a YouTube video page. The program is structured as a console application and includes a class, YouTubeVideoInfo, responsible for handling the extraction logic.

## Key Components:
### YouTubeVideoInfo Class:

The core class encapsulating the functionality.
Contains methods for extracting the html from a YouTube link and scraping HTML content for the video title.
### GetVideoTitleAsync Method:

Accepts a YouTube video link as input.
Retrieves the HTML content of the YouTube video page using an HTTP request.
Calls the appropriate method (ExtractVideoTitle) to extract the video title from the HTML.
### ExtractVideoTitle Method:

Uses the HtmlAgilityPack library to parse HTML content.
Locates the <title> tag within the HTML document, where the video title is typically found.
Extracts and returns the video title after removing any unnecessary information.
### Main Method (Program Class):

Demonstrates the usage of the YouTubeVideoInfo class by creating an instance and calling the GetVideoTitleAsync method.
Prints the retrieved video title to the console.

## Dependencies:
### HtmlAgilityPack:

Used for HTML parsing. Installed via the dotnet add package HtmlAgilityPack command.
### HttpClient:

Standard library for making HTTP requests.
