import { getSignedUrlForKey, s3 } from "../lib/s3.js";
import { PutObjectCommand } from "@aws-sdk/client-s3";
import prisma from "../exports/prisma.js";
import { summariserAgent } from "../aiAgents/summariserAgent.js";
import { followUp } from "../lib/followUp.js";
import { success } from "zod";

export async function generateSummary(req, res) {
    try {
        const { fileId, userId } = req.query;
    
        const fileRecord = await prisma.fileUpload.findUnique({
            where: { id: fileId, userId: userId },
        });
    
        if (!fileRecord) {
            return res.status(404).json({ message: 'File not found' });
        }
    
        const preSignedUrl = await getSignedUrlForKey(`uploads/${userId}/${fileId}`);
    
        const summary = await summariserAgent(preSignedUrl, fileRecord.mimeType);

        // create a md file and upload to s3
        const summaryKey = `summaries/${userId}/${fileId}.md`;
        await s3.send(
            new PutObjectCommand({
                Bucket: process.env.S3_BUCKET_NAME,
                Key: summaryKey,
                Body: summary,
                ContentType: 'text/markdown',
            })
        );  

        await prisma.fileUpload.update({
            where: { id: fileId },
            data: { generatedSummary: true },
        });

        res.status(200).json({ 
            success: true,
            message: 'Summary generated successfully', 
            data: {
                fileId: fileId,
                summary: summary,
            }
        });
    } catch (error) {
        res.status(500).json({ message: 'Internal Server Error'});
        console.error("Error generating summary:", error);
    }
}

export async function uploadFile(req, res) {
    try {
        const file = req.file;
        if (!file) {
            return res.status(400).json({ message: 'No file uploaded' });
        }
        const userId = req.body.userId;
        const fileId = crypto.randomUUID();

        await prisma.fileUpload.create({
            data: {
                id: fileId,
                originalName: file.originalname,
                mimeType: file.mimetype,
                userId: req.body.userId,
                size: file.size,    
            },
        });

        const s3Key = `uploads/${userId}/${fileId}`;

        await s3.send(
            new PutObjectCommand({
                Bucket: process.env.S3_BUCKET_NAME,
                Key: s3Key,
                Body: file.buffer,
                ContentType: file.mimetype,
            })
        );

        res.status(200).json({ 
            success: true,
            message: 'Document uploaded successfully', 
            data: {
                id: fileId,
                fileName: file.originalname,
                mimeType: file.mimetype,
                size: file.size,
                status: 'uploaded',
            }
        });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
}

export async function getSummary(req, res) {
    try {
        const { fileId, userId } = req.query;

        const summaryKey = `summaries/${userId}/${fileId}.md`;

        // extract summary from s3 and return json with summary text
        const summaryUrl = await getSignedUrlForKey(summaryKey);

        const summaryResponse = await fetch(summaryUrl);
        const summaryText = await summaryResponse.text();

        res.status(200).json({ 
            success: true,
            data: {
                fileId: fileId,
                summary: summaryText,
            }
        });
    } catch (error) {
        res.status(500).json({ message: 'Internal Server Error'});
        console.error("Error fetching summary:", error);
    }
}

export async function getUserSummaries(req, res) {
    try {
        const { userId } = req.query;

        if (!userId) {
            return res.status(400).json({ message: 'userId is required' });
        }

        const summaries = await prisma.fileUpload.findMany({
            where: {
                userId: userId,
                generatedSummary: true,
            },
            select: {
                id: true,
                originalName: true,
                mimeType: true,
                size: true,
                createdAt: true,
            },
        });

        res.status(200).json({ 
            success: true,
            data: summaries 
        });
    } catch (error) {
        res.status(500).json({ message: 'Internal Server Error'});
        console.error("Error fetching user summaries:", error);
    }
}

export async function getFollowUp(req, res) {
    try {
        const query = req.body.query
    
        const {fileId, userId} = req.query;

    
        const preSignedUrl = await getSignedUrlForKey(`summaries/${userId}/${fileId}.md`);
        const summaryResponse = await fetch(preSignedUrl);
        const summaryText = await summaryResponse.text();
        
        const response = await followUp(summaryText, query)
    
        // replace prev md file in s3 with the new appended one
    
        const updatedMdFile = `${summaryText}
        
        ${response}
        `
        const summaryKey = `summaries/${userId}/${fileId}.md`;
        await s3.send(
            new PutObjectCommand({
                Bucket: process.env.S3_BUCKET_NAME,
                Key: summaryKey,
                Body: updatedMdFile,
                ContentType: 'text/markdown',
            })
        ); 

        console.log(response)

        res.status(200).json({
            success: true,
            response: response
        })
        
    } catch (error) {
        res.status(500).json({ message: 'Internal Server Error'});
        console.error("Error fetching follow up:", error);
    }
    
}