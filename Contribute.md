## Manual Installation 
- Install Node.js locally 
- Clone the repo 
- Install dependencies 
- Start the db locally 
    - `docker run -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres`
    - Or go to neon.tech and get yourself a cloud DB 
- Change the .env file and update your DB credentials 
- `npm install express pg @prisma/adapter-pg`
- `npm install --save-dev @prisma/client prisma`
- `npx prisma migrate dev`
- `npx prisma generate`
- `npm run build`
- `npm start`


## Docker Installation 
- Install Docker 
- Create a network: `docker network create user_project`
- Start postgres:
    - `docker run --network user_project --name postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres`

### --- MAC / LINUX BUILD INSTRUCTIONS ---
# On Mac, Docker connects directly to the host Wi-Fi, so this flag works perfectly.
- Build image: `docker build --network=host -t user-project .`

### --- WINDOWS BUILD INSTRUCTIONS ---
# On Windows, Docker lives in a Virtual Machine. 
# Do NOT use --network=host, or the build will fail to download packages.
- Build image: `docker build -t user-project .`

- Start image: `docker run --network user_project -p 3000:3000 user-project`


## Docker Compose installation steps 
# (This method works perfectly on BOTH Mac and Windows without any changes!)
- Install Docker and Docker Compose 
- Run `docker-compose up`