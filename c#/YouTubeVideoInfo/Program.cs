using System;
using System.Net.Http;
using System.Threading.Tasks;
using HtmlAgilityPack;

public class YouTubeVideoInfo
{
    public async Task<string> GetVideoTitleAsync(string youtubeLink)
    {
        try
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = await client.GetAsync(youtubeLink);

                if (response.IsSuccessStatusCode)
                {
                    string html = await response.Content.ReadAsStringAsync();
                    string title = ExtractVideoTitle(html);
                    return title;
                }
                else
                {
                    Console.WriteLine($"Error: {response.StatusCode}");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }

        return null;
    }

    private string ExtractVideoTitle(string html)
    {
        HtmlDocument doc = new HtmlDocument();
        doc.LoadHtml(html);

        // The title of the video is typically found within the <title> tag
        HtmlNode titleNode = doc.DocumentNode.SelectSingleNode("//title");

        if (titleNode != null)
        {
            string title = titleNode.InnerText;
            // Extract the actual video title from the full title (which may include other information)
            title = title.Replace(" - YouTube", "").Trim();
            return title;
        }

        return null;
    }
}

class Program
{
    static async Task Main()
    {
        YouTubeVideoInfo videoInfo = new YouTubeVideoInfo();

        string youtubeLink = "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley";
        string videoTitle = await videoInfo.GetVideoTitleAsync(youtubeLink);

        if (videoTitle != null)
        {
            Console.WriteLine($"Video Title: {videoTitle}");
        }
        else
        {
            Console.WriteLine("Failed to retrieve video title.");
        }
    }
}
