import userResolvers from "./user";
import habitResolvers from "./habit";
import tagResolvers from "./tag";
import taskResolvers from "./habit";

const resolvers = {
	Query: {
		...userResolvers.Query,
		...habitResolvers.Query,
		...tagResolvers.Query,
		...taskResolvers.Query,
	},
	Mutation: {
		...userResolvers.Mutation,
		...habitResolvers.Mutation,
		...tagResolvers.Mutation,
		...taskResolvers.Mutation,
	},
};

export default resolvers;
