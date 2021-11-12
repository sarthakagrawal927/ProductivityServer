import queries from "./queries.graphql";
import mutations from "./mutations.graphql";
const taskResolvers = {
	Query: {
		...queries,
	},
	Mutation: {
		...mutations,
	},
};

export default taskResolvers;
