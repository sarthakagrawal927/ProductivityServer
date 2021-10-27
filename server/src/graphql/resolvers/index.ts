import userResolvers from "./user";

const resolvers = {
	Query: {
		...userResolvers.Query,
	},
};

export default resolvers;
