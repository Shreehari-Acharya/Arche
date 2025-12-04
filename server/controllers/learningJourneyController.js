import roadmapAgent from "../aiAgents/roadmapAgent.js";
import prisma from "../exports/prisma.js";
import findRelevantVideoMaterials from "../lib/findRelevantVideoMaterials.js";

// ✅ CREATE NEW JOURNEY
async function newLearningJourney(req, res) {
  const {
    topicName,
    skillLevel,
    language,
    hoursPerDay,
    monthsToComplete,
    userId,
  } = req.body;

  try {
    if (!topicName || !skillLevel || !language || !hoursPerDay || !monthsToComplete || !userId) {
      return res.status(400).json({ error: "All fields are required." });
    }

    const learningJourney = await prisma.learningJourney.create({
      data: { topicName, userId },
    });

    await prisma.learningPreference.create({
      data: {
        mainTopicName: topicName,
        skillLevel,
        language,
        hoursPerDay,
        monthsToComplete,
        learningJourneyId: learningJourney.id,
      },
    });

    const roadmap = await roadmapAgent(
      topicName,
      `${hoursPerDay} hours per day for ${monthsToComplete} months`
    );

    const subTopicsData = await prisma.subTopic.createManyAndReturn({
      data: roadmap.map((dayTopic) => ({
        description: dayTopic,
        learningJourneyId: learningJourney.id,
        isCompleted: false, // ✅ important
      })),
    });

    await findRelevantVideoMaterials(subTopicsData, 3);

    return res.status(201).json({
      success: true,
      message: "Learning journey created successfully.",
      data: { id: learningJourney.id },
    });
  } catch (error) {
    console.error("Error in newLearningJourney:", error);
    return res.status(500).json({ error: "Internal server error." });
  }
}

// ✅ GET JOURNEYS & DETAILS
async function getLearningJourneys(req, res) {
  const { userId, learningJourneyId } = req.query;

  if (!userId) {
    return res.status(400).json({ error: "userId is required." });
  }

  try {
    if (learningJourneyId) {
      const learningJourney = await prisma.learningJourney.findUnique({
        where: { id: learningJourneyId },
        include: {
          subTopics: {
            include: { videoResources: true },
          },
        },
      });

      if (!learningJourney) {
        return res.status(404).json({ error: "Learning journey not found." });
      }

      return res.status(200).json({
        success: true,
        data: learningJourney,
      });
    } else {
      const learningJourneys = await prisma.learningJourney.findMany({
        where: { userId },
      });

      return res.status(200).json({
        success: true,
        data: learningJourneys,
      });
    }
  } catch (error) {
    console.error("Error fetching learning journeys:", error);
    return res.status(500).json({ error: "Internal server error." });
  }
}

// ✅ ✅ ✅ FIXED MARK TASK COMPLETE API
async function updateProgress(req, res) {
    console.log("updateProgress called with body:", req.body);
  const { subTopicId } = req.body;

  if (!subTopicId) {
    return res.status(400).json({ error: "subTopicId is required." });
  }

  try {
    // ✅ STEP 1: Get current completion state
    const previous = await prisma.subTopic.findUnique({
      where: { id: subTopicId },
      select: { isCompleted: true },
    });

    if (!previous) {
      return res.status(404).json({ error: "Sub-topic not found." });
    }

    // ✅ STEP 2: Toggle completion
    const updatedSubTopic = await prisma.subTopic.update({
      where: { id: subTopicId }, // ✅ VALID PRISMA USAGE
      data: { isCompleted: !previous.isCompleted },
    });

    return res.status(200).json({
      success: true,
      message: "Sub-topic completion updated successfully.",
      updatedSubTopic,
    });
  } catch (error) {
    console.error("Error updating progress:", error);
    return res.status(500).json({ error: "Internal server error." });
  }
}

export { newLearningJourney, getLearningJourneys, updateProgress };
