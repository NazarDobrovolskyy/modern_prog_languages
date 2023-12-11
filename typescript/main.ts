import axios from 'axios';
import * as cheerio from 'cheerio';

class YouTubeVideoInfo {
  public async getVideoTitle(youtubeLink: string): Promise<string | null> {
    try {
      const response = await axios.get(youtubeLink);

      if (response.status === 200) {
        const title = this.extractVideoTitle(response.data);
        return title;
      } else {
        console.error(`Error: ${response.status}`);
      }
    } catch (error) {
      console.error(`Exception: ${error.message}`);
    }

    return null;
  }

  private extractVideoTitle(html: string): string | null {
    const $ = cheerio.load(html);

    // The title of the video is typically found within the <title> tag
    const titleElement = $('title');
    const title = titleElement.text().replace(' - YouTube', '').trim();

    return title || null;
  }
}

// Example usage
async function main() {
  const videoInfo = new YouTubeVideoInfo();
  const youtubeLink = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley';
  const videoTitle = await videoInfo.getVideoTitle(youtubeLink);

  if (videoTitle !== null) {
    console.log(`Video Title: ${videoTitle}`);
  } else {
    console.log('Failed to retrieve video title.');
  }
}

main();
