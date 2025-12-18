import { google } from "googleapis"
import dotenv from "dotenv"

dotenv.config()

const youtube = google.youtube({
    version: "v3",
    auth: process.env.GOOGLE_YT_API_KEY,
})

async function searchYouTube(query, maxResults) {
    const response = await youtube.search.list({
        part: ["snippet"],
        q: query,
        maxResults: maxResults,
        type: ["video"],
        videoDuration: "long", // only long videos
    })
    return response.data.items
}
export { searchYouTube }