FROM node:14.9.0-alpine3.12 as build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . . 

RUN npm run build

FROM node:14.9.0-alpine3.12

WORKDIR /app

COPY --from=build /app/dist .
COPY --from=build /app/node_modules node_modules



CMD ["node", "main"]