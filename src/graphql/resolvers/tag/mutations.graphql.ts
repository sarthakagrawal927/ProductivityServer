import { ApolloContext } from "../../../context";
import { Prisma } from "@prisma/client";
import { MutationResolvers, Tag } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, Tag> = {
	async createTag(_, { createTagInput }, { prisma }: ApolloContext) {
		console.log(createTagInput);
		let newTag: Prisma.TagCreateInput = {
			name: createTagInput.name,
			description: createTagInput.description,
		};
		console.log(newTag);
		const tag: Tag = await prisma.tag.create({ data: newTag });
		return tag;
	},
};

export default mutations;
