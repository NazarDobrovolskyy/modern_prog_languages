# YouTube Video Title Extractor

## Overview

This Rust program is designed to extract the title of a YouTube video given its link. It achieves this by making an HTTP request to the YouTube page, parsing the HTML content using the `select` crate, and extracting the video title from the `<title>` tag.

The program is structured as an asynchronous Rust application, utilizing the `tokio` runtime to handle asynchronous tasks. It leverages the `reqwest` crate for making HTTP requests and the `select` crate for HTML parsing.

## How it Works

1. The main function (`main`) initializes the Tokio runtime and calls the asynchronous function `get_video_title` to retrieve the title of a YouTube video.

2. The `get_video_title` function takes a YouTube video link as input, makes an HTTP GET request to the provided link using `reqwest::get`, and asynchronously retrieves the HTML content of the page.

3. The HTML content is then parsed using the `Document::from_read` method from the `select` crate, creating a document object that allows us to navigate and query the HTML structure.

4. The program looks for the `<title>` tag within the HTML content using the `document.find(Name("title"))` method. If found, it extracts the text content of the title node.

5. The extracted title is then processed to remove any additional information (e.g., " - YouTube") that may be present in the full title.

6. The final video title is returned as a `Result<String, Box<dyn std::error::Error>>`, where success contains the video title, and an error indicates a failure to find the title node or other potential issues.

7. The main function prints the retrieved video title to the console if successful, or an error message if there's an issue during the process.

## Dependencies

- `reqwest` (v0.11): Used for making HTTP requests.
- `select` (v0.5): Used for HTML parsing.
- `tokio` (v1): Asynchronous runtime for handling asynchronous tasks.

## How to Run

Ensure that you have Rust and Cargo installed on your system. Add the necessary dependencies to your `Cargo.toml` file, and then run the program using:

```
cargo run
```