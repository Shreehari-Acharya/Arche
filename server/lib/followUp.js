import { answerAgent } from "../aiAgents/answerAgent.js";
import { ytResourceFinder } from "../aiAgents/ytQueryGenerator.js";

export async function followUp(context, query) {

    const reply = await answerAgent(query, context)
    
    const relevantYtResources = await ytResourceFinder(query)

    const finalAnswer = `${reply}
    
    ${relevantYtResources}
    `

    return finalAnswer
}