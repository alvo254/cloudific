FROM node:18-alpine

WORKDIR /frontend

COPY ./frontend/public/ ./public
COPY ./frontend/src/ ./src
COPY ./frontend/package.json ./

RUN npm install

CMD ["npm", "start"]