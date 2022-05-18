import * as dotenv from "dotenv";
import { createConnection } from "typeorm";
import "reflect-metadata";
import express from "express";
import { ApolloServer } from "apollo-server-express";
import { buildSchema } from "type-graphql";
import { User } from "./models/User";
import { UserResolver } from "./resolvers/user.resolver";

const main = async () => {
  dotenv.config();
  const app = express();
  await createConnection({
    type: "postgres",
    host: "localhost",
    username: "postgres",
    password: "postgres",
    database: "framboise",
    synchronize: true,
    entities: [User],
  });

  const server = new ApolloServer({
    schema: await buildSchema({ resolvers: [UserResolver] }),
    debug: true,
    context: ({ req, res }) => ({ req, res }),
  });
  await server.start();
  server.applyMiddleware({ app });
  app.listen(5000, () => {
    console.log(`🚀 Server ready at localhost:5000`);
  });
};
main();
