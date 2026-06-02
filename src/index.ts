import express from 'express';
import { PrismaClient } from './generated/prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const app = express();

// 1. Setup the database connection pool (using your local Docker credentials)
const connectionString = process.env.DATABASE_URL || "postgres://postgres:mysecretpassword@postgres:5432/postgres?sslmode=disable";
const pool = new Pool({ connectionString });

// 2. Create the Prisma adapter
const adapter = new PrismaPg(pool);

// 3. Initialize Prisma Client with the adapter
const prisma = new PrismaClient({ adapter });

app.get("/", async (req, res) => {
    // Fetches all users from the database
    const data = await prisma.user.findMany();

    res.json({
        message: "get endpoint",
        data: data
    });
});

app.post('/', async (req, res) => {
  // Creates a new random user
  await prisma.user.create({
    data: {
      username: Math.random().toString(),
      password: Math.random().toString()
    }
  });
  
  res.json({
    message: "post endpoint"
  });
});

app.listen(3000, () => {
    console.log("Server is running on port 3000");
});