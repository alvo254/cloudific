# Stage 1: Build the React application
FROM node:18-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Setup the production environment
FROM node:18-alpine as production-stage
WORKDIR /app

# Install Express
COPY --from=build-stage /app/package.json /app/package.json
RUN npm install express

# Copy the build directory and server script from the build-stage
COPY --from=build-stage /app/build /app/build
COPY --from=build-stage /app/server.js /app/server.js

EXPOSE 3000
CMD ["node", "server.js"]