# YouTube Video Title Extraction Code Report

## Objective
The purpose of this code is to extract the title of a YouTube video from a given YouTube link. This is achieved by making an HTTP request to the YouTube page, retrieving the HTML content, and then parsing the HTML to extract the video title.

## Technologies Used
1. **Node.js and npm**: The code is written in TypeScript and runs on the Node.js runtime. npm is used for managing project dependencies.

2. **Axios**: Axios is a popular HTTP client for making requests. In this code, it is used to send an HTTP GET request to the YouTube page and retrieve the HTML content.

3. **Cheerio**: Cheerio is a fast and flexible HTML parsing library. It provides a jQuery-like interface for traversing and manipulating the HTML structure. In this code, Cheerio is used to extract the video title from the HTML.

## Steps to Run the Code

### 1. Install Node.js and npm
Ensure that Node.js and npm are installed on your system. If not, download and install them from [Node.js official website](https://nodejs.org/).

### 2. Create a New TypeScript Project
Create a new directory for your project and initialize it as a Node.js project:

```
npm init -y
```
### 3. Install Required Packages

Install the required npm packages (axios and cheerio) for the project:

```
npm install axios cheerio
```

### 4. Compile TypeScript Code

Compile the TypeScript code into JavaScript using the TypeScript compiler (tsc):

```
npx tsc main.ts
```

### 5. Run the JavaScript Code

```
node main.js
```
