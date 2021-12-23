FROM node:16.13.0-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm config set unsafe-perm true
RUN npm install --silent

COPY . .

RUN chown -R node /app/node_modules

USER node

CMD ["npm", "start"]