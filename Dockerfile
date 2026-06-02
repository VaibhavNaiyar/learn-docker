FROM node:20-alpine

WORKDIR /app

# 1. Install OpenSSL (Required by Prisma on Alpine Linux)
RUN apk add --update --no-cache openssl

# 2. Copy dependency files early for caching
COPY ./package.json ./package.json
COPY ./tsconfig.json ./tsconfig.json
COPY ./package-lock.json ./package-lock.json
COPY ./prisma ./prisma

# 3. Install dependencies
RUN npm install

# 4. Copy the rest of your application code
COPY . .

# 5. Generate the Prisma Client (No database connection needed for this)
RUN npx prisma generate

# 6. Build the TypeScript project
RUN npm run build

ENV DATABASE_URL=postgres://postgres:mysecretpassword@postgres:5432/postgres

EXPOSE 3000

# 7. Run migrations then start the application
CMD ["sh", "-c", "npx prisma migrate deploy && npm start"]