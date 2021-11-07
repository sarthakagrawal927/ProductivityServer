import { ApolloContext } from "../../../context";
import { User, MutationResolvers } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, User> = {
	async createUser(_, { createUserInput }, { prisma }: ApolloContext) {
		const user: User = await prisma.user.create({
			data: {
				email: createUserInput.email,
				name: createUserInput.name,
				password: createUserInput.password,
			},
		});
		return user;
	},
};

export default mutations;
