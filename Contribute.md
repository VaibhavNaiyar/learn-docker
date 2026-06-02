## Manual Installation 
-Install nodejs locally 
--clone the repo 
-install dependencies 
-start the db locally 
    -docker run -e POSTGRES_PASSWORD=mysecretpassword  -d  -p 5432:5432 postgess
    -or Go to neon tech get yourself a db 
- change the .env file and update your DB credentials 
-npm install express pg @prisma/adapter-pg
-npm install --save-dev @prisma/client prisma
-npx prisma migrate
-npx prisma generate
-npm run build 
-npm start 



## Docker installation 
-Install docker 
-start postgres
    -docker run -e POSTGRES_PASSWORD=mysecretpassword  -d  -p 5432:5432 postgess
-build image - ` docker build -t user-project`
-start image - `docker run -p 3000:3000 user-project`



## Docker Compose installation steps 
-Install docker ,docker compose 
-Run `docker-compose up`


