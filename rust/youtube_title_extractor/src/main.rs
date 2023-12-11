use reqwest;
use select::document::Document;
use select::predicate::Name;

#[derive(Debug)]
struct CustomError;

impl std::fmt::Display for CustomError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "Failed to find title node")
    }
}

impl std::error::Error for CustomError {}

async fn get_video_title(youtube_link: &str) -> Result<String, Box<dyn std::error::Error>> {
    let response = reqwest::get(youtube_link).await?;
    let body = response.text().await?;

    let document = Document::from_read(body.as_bytes());
    let document = match document {
        Ok(doc) => doc,
        Err(err) => return Err(Box::new(err)),
    };

    let title_node = document.find(Name("title")).next();

    match title_node {
        Some(node) => {
            let title = node.text();
            // Extract the actual video title from the full title (which may include other information)
            let video_title = title.replace(" - YouTube", "").trim().to_string();
            Ok(video_title)
        }
        None => Err(Box::new(CustomError)),
    }
}

#[tokio::main]
async fn main() {
    let youtube_link = "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley";

    match get_video_title(youtube_link).await {
        Ok(title) => println!("Video Title: {}", title),
        Err(err) => eprintln!("Error: {}", err),
    }
}
