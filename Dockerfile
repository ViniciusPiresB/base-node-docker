FROM node:16.3.0-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./

RUN npm install

COPY --chown=node:node . .

ARG PORT=3000
ENV PORT=$PORT

EXPOSE ${PORT}

CMD ["npm", "run", "dev"]