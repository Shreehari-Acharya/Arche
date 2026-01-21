
## **Arche – The place where learning begins**

**Arche** is an AI-driven platform designed to help students study smarter through personalized learning paths, curated resources, smart notes, and active revision tools. Instead of generating explanations, the platform finds the *best real learning material* online and organizes it into a structured weekly course.

---

## Demo Video


https://github.com/user-attachments/assets/d5b6edad-9a66-490b-a0a0-59d5c53cbc34



## **Core Features**

### **Topic-Based Resource Discovery**

Students choose a topic (e.g., “Linux” or “Python”), and the app automatically finds high-quality YouTube videos, articles, and tutorials. It focuses on resource curation—not AI-created lessons.

### **AI Study Planner + Smart Notes**

Users can upload PDFs/PPTs. The system generates:

* A personalized study plan based on timeline & effort
* Clean summarized notes
* Mindmaps of important concepts

### **Instant Revision System**

The platform creates quizzes/tests from the uploaded materials (MCQs, short answers, essays).
AI evaluates answers and provides clear feedback.

### **Daily Reminders & Streaks**

Smart reminders help learners stay on track with their study plan, building consistency through streaks and notifications.

---

## **System Stages (Core Logic Pipeline)**

### **Stage 1: User Onboarding → Structured JSON Preferences**

A short conversational onboarding collects:

* Topic/subject
* Skill level
* Preferred language
* Video style (short/medium/long)
* Goal for learning
  The output is a neatly structured JSON object.

### **Stage 2: AI-Generated Weekly Roadmap**

Using the onboarding data, the system produces a personalized weekly roadmap with sub-topics and learning milestones tailored to the user's level and goal.

### **Stage 3: Automated YouTube Search + Curated Playlist**

For each weekly topic, the app creates YouTube search queries based on language and video length, filters by quality, and returns a curated playlist of 2–3 top videos.

### **Stage 4: Clean Weekly Course Presentation**

The roadmap and curated videos are combined into a scannable weekly course layout, ready to be displayed on a frontend (React/HTML).

---
