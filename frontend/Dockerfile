FROM node:18-alpine

WORKDIR /frontend

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


# Production stage
FROM node:18-alpine
WORKDIR /app
COPY --from=build-stage /app/build /app/build
COPY --from=build-stage /app/server.js /app/server.js
COPY --from=build-stage /app/package.json /app/package.json
RUN npm install express
EXPOSE 3000
CMD ["npm", "start"]