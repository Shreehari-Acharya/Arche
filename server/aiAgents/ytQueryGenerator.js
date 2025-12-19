import ai from "../exports/gemini.js";
import { searchYouTube } from "../lib/ytSearch.js";


async function queryAgent(query) {
  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: `The user has asked a question. Your job is to
    create a youtube search query, that may give me relevant youtube
    videos that will answer the question asked by the user.
    Please just output the query. I will paste it into youtube search
    Do not begin with query: or any similar words. I just need the actual query
    
    Here is the question - ${query}
    If its ambigious, you cannot create query, then output just any 3 characters.
    `,
  });

  return response.text

}

export async function ytResourceFinder(query) {
    const ytSearchQuery = await queryAgent(query);
    // console.log(ytSearchQuery)

    if (ytSearchQuery.trim().length <=3 ) {
        return "";
    }
    const ytVideo = await searchYouTube(ytSearchQuery, 2);

    // console.log(ytVideo)

    // create markdown to append

    const markdownResults = `
## Youtube Resources
[![${ytVideo[0].snippet.title}](https://img.youtube.com/vi/${ytVideo[0].id.videoId}/0.jpg)](https://www.youtube.com/watch?v=${ytVideo[0].id.videoId})
[![${ytVideo[1].snippet.title}](https://img.youtube.com/vi/${ytVideo[1].id.videoId}/0.jpg)](https://www.youtube.com/watch?v=${ytVideo[1].id.videoId})
    `

    return markdownResults
}

