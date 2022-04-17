FROM node:17-alpine

RUN mkdir /app
WORKDIR /app
COPY package.json ./package.json
RUN npm install -g serverless && npm install -g serverless-offline && npm install
COPY . .
RUN serverless plugin install -n serverless-offline
RUN npx prisma generate

CMD ["npm", "run", "start"]