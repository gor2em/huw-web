FROM node:latest
WORKDIR /app
COPY package.*json ./
RUN npm install
COPY . /app
RUN npm run build
CMD [ "npm", "run", "preview" ]
