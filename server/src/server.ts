import { ApolloServer } from "apollo-server";
import typeDefs from "./graphql/typeDefs";
import resolvers from "./graphql/resolvers";
import { context } from "./context";

const PORT = process.env.PORT || 4000;

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context,
});

server.listen({ port: PORT }, () =>
  console.log(`🚀 Server listening at: http://localhost:${PORT}`),
);
