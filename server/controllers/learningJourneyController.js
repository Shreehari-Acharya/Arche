import roadmapAgent from "../aiAgents/roadmapAgent.js";
import prisma from "../exports/prisma.js";
import findRelevantVideoMaterials from "../lib/findRelevantVideoMaterials.js";

const streakToupdate = (details) => {
  const today = new Date();
  const lastDate = new Date(details.lastAccessed);
  const diffTime = Math.abs(today - lastDate);
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  if (diffDays === 1) {
    return details.streakCount + 1;
  } else if (diffDays > 1) {
    return 1;
  } else {
    return details.streakCount;
  }
};

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
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const learningJourney = await prisma.learningJourney.create({
      data: { topicName, userId, lastAccessed: yesterday },
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
        isCompleted: false, 
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


async function updateProgress(req, res) {
    // console.log("updateProgress called with body:", req.body);
  const { subTopicId } = req.body;

  if (!subTopicId) {
    return res.status(400).json({ error: "subTopicId is required." });
  }

  try {

    const previous = await prisma.subTopic.findUnique({
      where: { id: subTopicId },
      select: { learningJourneyId: true, isCompleted: true },
    });

    if (!previous) {
      return res.status(404).json({ error: "Sub-topic not found." });
    }

    const previousStreakDetails = await prisma.learningJourney.findFirst({
      where: {
        id: previous.learningJourneyId,
      },
      select: { lastAccessed: true, streakCount: true },
    });

    const updatedSubTopic = await prisma.subTopic.update({
      where: { 
        id: subTopicId,
      },
      data: { isCompleted: true },
    });

    const updateStreakDetails = await prisma.learningJourney.update({
      where: {
        id: previous.learningJourneyId,
      },
      data: {
        lastAccessed: new Date(),
        streakCount: streakToupdate(previousStreakDetails),
      },
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
