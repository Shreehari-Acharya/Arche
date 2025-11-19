import roadmapAgent from "../aiAgents/roadmapAgent.js";
import prisma from "../exports/prisma.js";

async function newLearningJourney(req, res) {
    
    const {
        topicName,
        skillLevel,
        language,
        hoursPerDay,
        monthsToComplete
    } = req.body;

    try {
        // Validate input
        if (!topicName || !skillLevel || !language || !hoursPerDay || !monthsToComplete) {
            return res.status(400).json({ error: 'All fields are required.' });
        }

        // Create new learning journey
        try {
            const learningJourney = await prisma.learningJourney.create({
                data: {
                    topicName: topicName,
                    userId: req.body.userId, 
                }
            });
                    
            const learningPreference = await prisma.learningPreference.create({
                data: {
                    mainTopicName: topicName,
                    skillLevel: skillLevel, 
                    language: language,
                    hoursPerDay: hoursPerDay,
                    monthsToComplete: monthsToComplete,
                    learningJourneyId: learningJourney.id,
                }
            });

            // return res.status(201).json(learningPreference);   
            const roadmap = await roadmapAgent(topicName, `${hoursPerDay} hours per day for ${monthsToComplete} months`);
            // return res.status(201).json(roadmap);
        }
        catch (creationError) {
            console.error('Error creating learning journey:', creationError);
            return res.status(500).json({ error: 'Failed to create learning journey.' });
        }
    } 
    catch (error) {
        console.error('Error in newLearningJourney:', error);
        return res.status(500).json({ error: 'Internal server error.' });
    }
}

export { newLearningJourney };