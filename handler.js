"use strict";

const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

module.exports.createCostumer = async (event) => {
  const { first_name, last_name, age } = JSON.parse(event.body);
  const newCostumer = await createCostumer({ first_name, last_name, age });
  return {
    statusCode: 200,
    body: JSON.stringify(newCostumer),
  };
}

async function createCostumer(costumer) {
  return await prisma.costumers.create({
    data: {
      ...costumer,
      created_by: 1
    }
  });
}

module.exports.findAllCostumers = async (event) => {
  const costumers = await findAllCostumers();
  return {
    statusCode: 200,
    body: JSON.stringify(costumers),
  };
}

async function findAllCostumers() {
  return await prisma.costumers.findMany();
}
