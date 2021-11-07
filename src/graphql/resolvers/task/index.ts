import queries from "./queries.graphql";
import mutations from "./mutations.graphql";
const habitResolvers = {
  Query: {
    ...queries,
  },
  Mutation: {
    ...mutations,
  },
};

export default habitResolvers;
