import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import learningJourneyRouter from './routes/learningJourneyRoute.js';
import authRouter from './routes/authRoute.js';
import quizRouter from './routes/quizRoute.js';
import summaryRouter from './routes/summaryRoute.js';
dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/auth', authRouter);
app.use('/api/learning-journeys', learningJourneyRouter);
app.use('/api/quizzes', quizRouter);
app.use('/api/summary', summaryRouter);

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
