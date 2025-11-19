import { GoogleGenAI } from "@google/genai"
import dotenv from "dotenv"

dotenv.config()

console.log("GEMINI API KEY:", process.env.GEMINI_API_KEY);
const ai = new GoogleGenAI({
  apiKey: process.env.GEMINI_API_KEY,
})

export default ai