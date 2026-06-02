FROM node:20-alpine

WORKDIR /app

# 1. Install OpenSSL (Required by Prisma on Alpine Linux)
RUN apk add --update --no-cache openssl

COPY ./package.json ./package.json
COPY ./tsconfig.json ./tsconfig.json
COPY ./package-lock.json ./package-lock.json
COPY ./prisma ./prisma

# 2. Install dependencies

RUN npm install
RUN apk add --update --no-cache openssl 
#we do this because prisma needs openssl to generate the client and run the migrations, and it is not included in the base image
COPY . .

ENV = DATABASE_URL="postgres://postgres:mysecretPAssword@localhost:5432/postgres?sslmode=disable"

# 3. Generate the Prisma Client 
RUN npx prisma migrate dev
RUN npx prisma generate

# 4. Build the TypeScript project
RUN npm run build

# 5. Start the application
CMD ["npm", "start"]