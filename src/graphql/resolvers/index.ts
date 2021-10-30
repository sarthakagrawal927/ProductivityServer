import userResolvers from "./user";
import habitResolvers from "./habit";
import tagResolvers from "./tag";

const resolvers = {
  Query: {
    ...userResolvers.Query,
    ...habitResolvers.Query,
    ...tagResolvers.Query,
  },
  Mutation: {
    ...userResolvers.Mutation,
    ...habitResolvers.Mutation,
    ...tagResolvers.Mutation,
  },
};

export default resolvers;
