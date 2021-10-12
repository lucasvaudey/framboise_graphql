"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv = __importStar(require("dotenv"));
const typeorm_1 = require("typeorm");
require("reflect-metadata");
const express_1 = __importDefault(require("express"));
const apollo_server_express_1 = require("apollo-server-express");
const type_graphql_1 = require("type-graphql");
const User_1 = require("./models/User");
const user_resolver_1 = require("./resolvers/user.resolver");
const main = async () => {
    dotenv.config();
    const app = (0, express_1.default)();
    await (0, typeorm_1.createConnection)({
        type: "postgres",
        host: "localhost",
        username: "postgres",
        password: "postgres",
        database: "framboise",
        synchronize: true,
        entities: [User_1.User],
    });
    const server = new apollo_server_express_1.ApolloServer({
        schema: await (0, type_graphql_1.buildSchema)({ resolvers: [user_resolver_1.UserResolver] }),
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
//# sourceMappingURL=index.js.map