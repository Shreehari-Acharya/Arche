import roadmapAgent from "../aiAgents/roadmapAgent.js";
import prisma from "../exports/prisma.js";
import findRelevantVideoMaterials from "../lib/findRelevantVideoMaterials.js";

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

            const roadmap = await roadmapAgent(topicName, `${hoursPerDay} hours per day for ${monthsToComplete} months`);

            const subTopicsData = await prisma.subTopic.createManyAndReturn({
                data: roadmap.map((dayTopic) => ({
                    description: dayTopic,
                    learningJourneyId: learningJourney.id,
                })),
            });

            await findRelevantVideoMaterials(subTopicsData, 3);

            return res.status(201).json({
                success: true,
                message: 'Learning journey created successfully.',
                data: { id: learningJourney.id }
            });
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

async function getLearningJourneys(req, res) {
    const { userId } = req.query;

    if (!userId) {
        return res.status(400).json({ error: 'userId query parameter is required.' });
    }

    const { learningJourneyId } = req.query;

    if (learningJourneyId) {
        try {
            const learningJourney = await prisma.learningJourney.findUnique({
                where: { id: learningJourneyId, userId: userId },
                include: {
                    subTopics: {
                        include: {
                            videoResources: true
                        }
                    }
                }
            });

            if (!learningJourney) {
                return res.status(404).json({ error: 'Learning journey not found.' });
            }

            return res.status(200).json({
                success: true,
                data: learningJourney
            });
        } catch (error) {
            console.error('Error fetching learning journey by ID:', error);
            return res.status(500).json({ error: 'Internal server error.' });
        }
    }
    else {
        try {
            const learningJourneys = await prisma.learningJourney.findMany({
                where: { userId: userId },
            });

            return res.status(200).json({
                success: true,
                data: learningJourneys
            });
        } catch (error) {
            console.error('Error fetching learning journeys:', error);
            return res.status(500).json({ error: 'Internal server error.' });
        }
    }
}

export { newLearningJourney, getLearningJourneys };