import jwt from "jsonwebtoken"
import prisma from "../exports/prisma.js";
import bcrypt from "bcrypt";
import dotenv from "dotenv";

dotenv.config();

async function login(req, res) {
    const { email, password } = req.body;

    try {
        const user = await prisma.user.findUnique({ where: { email } });

        if (!user) {
            return res.status(401).json({ error: 'Invalid email or password.' });
        }

        const passwordMatch = await bcrypt.compare(password, user.password_hash);

        if (!passwordMatch) {
            return res.status(401).json({ error: 'Invalid email or password.' });
        }
        
        const token = jwt.sign({ user: user }, process.env.JWT_SECRET, { expiresIn: "72h" });
        console.log('Generated JWT token:', token);
        return res.status(200).json({ message: 'Login successful.', token });
    } catch (error) {
        console.error('Error during login:', error);
        return res.status(500).json({ error: 'Internal server error.' });
    }
}

async function register(req, res) {
    const { email, password, fullname } = req.body;

    try {
        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (existingUser) {
            return res.status(409).json({ error: 'Email already in use.' });
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = await prisma.user.create({
            data: { email, password_hash: hashedPassword, name: fullname },
        });

        console.log('New user registered:', newUser);

        return res.status(201).json({ success: true, message: 'Registration successful.', userId: newUser.id });
    } catch (error) {
        console.error('Error during registration:', error);
        return res.status(500).json({ error: 'Internal server error.' });
    }
}

export { login, register };