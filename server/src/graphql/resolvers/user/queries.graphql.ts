import { ApolloContext } from "../../../context";

const queries = {
	async getUser(_parent: any, args: { id: string }, { prisma }: ApolloContext) {
		const user = prisma.user.findUnique({
			where: {
				id: args.id,
			},
		});

		return user;
	},
};

export default queries;
