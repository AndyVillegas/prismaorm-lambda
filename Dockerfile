FROM node:17-alpine

RUN mkdir /app
WORKDIR /app
COPY package.json ./package.json
RUN npm install
COPY prisma ./prisma/
RUN npx prisma generate
COPY . .

CMD ["npm", "run", "start"]