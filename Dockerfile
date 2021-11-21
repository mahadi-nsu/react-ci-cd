FROM node:14
# Create an app directory to hold the application code inside the image
#RUN mkdir -p /app
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied.
#COPY ["package.json", "package-lock.json"]
COPY package*.json ./


# Install app dependencies
RUN npm install

#This command is going to copy the source code into the image 
COPY . /app 
#COPY . .
#Exposing port 8080 on the container.EXPOSE doesn't publish the port, but  instead
#function functions as a way of docementing which port on the container will be published at runtime
EXPOSE 3000

#command to start the application. Noted there should only be one CMD instruction in each Dockerfile
#if you include more than one, only the last will take effect
CMD ["npm", "start"]