import queries from "./queries.graphql";

const userResolvers = {
	Query: {
		...queries,
	},
};

export default userResolvers;
