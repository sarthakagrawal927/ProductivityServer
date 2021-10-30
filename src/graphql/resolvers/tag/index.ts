import queries from "./queries.graphql";
import mutations from "./mutations.graphql";
const tagResolvers = {
  Query: {
    ...queries,
  },
  Mutation: {
    ...mutations,
  },
};

export default tagResolvers;
