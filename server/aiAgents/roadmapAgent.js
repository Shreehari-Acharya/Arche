// Roadmap agent that creates detailed learning roadmap for a given topic
// by taking the amount of time user can give to learn that particular topic.

import ai from "../exports/gemini.js"
import { z } from "zod"
import { zodToJsonSchema } from "zod-to-json-schema"

// Schema for the entire roadmap
const RoadmapSchema = z.array(
  z.string().describe("A day-wise topic to be covered in the learning roadmap")
).describe("Learning Roadmap, the amount of strings should be equal to the number of days calculated based on the time commitment.");



const roadmapAgent = async (topic, timeCommitment) => {
  const prompt = `You are an expert study planner. Your sole task it to create a detailed
  learning roadmap for a given topic. You will return an array of strings, where each string
  represents a day-wise topic to be covered. It should be decided based on the time commitment 
  the user can give in a day. If a particular topic requires more time, break it down into multiple days.
  If the topic is to be studied over multiple months, then the number of days need to be calculated as months * 28.
  Each week should have 7 days. Make sure to cover all important sub-topics of the main topic.
  The roadmap should be practical and achievable within the given time frame.

  Topic: ${topic}
  Time Commitment: ${timeCommitment}

  Return the roadmap as an array of strings, where each string represents a day-wise topic to be covered.
  `

  const response = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: prompt,
    config: {
        responseMimeType: "application/json",
        responseJsonSchema: zodToJsonSchema(RoadmapSchema),
    }
  })
    // console.log("Roadmap Agent Response:", (response.text));
    const roadmap = RoadmapSchema.parse(JSON.parse(response.text));
    // console.log(roadmap);

    return roadmap;
}

export default roadmapAgent