FROM node:17-alpine

RUN mkdir /app
WORKDIR /app
COPY package*.json ./
RUN npm install -g serverless && npm install
COPY prisma ./prisma/
RUN npx prisma generate
COPY . .
RUN serverless plugin install -n serverless-offline

CMD ["npm", "run", "start"]