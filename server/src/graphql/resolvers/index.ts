import userResolvers from "./user";
import habitResolvers from "./habit";

const resolvers = {
  Query: {
    ...userResolvers.Query,
    ...habitResolvers.Query,
  },
  Mutation: {
    ...userResolvers.Mutation,
    ...habitResolvers.Mutation,
  },
};

export default resolvers;
