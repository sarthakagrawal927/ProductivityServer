import { ApolloContext } from "../../../context";
import { Prisma, Tag } from "@prisma/client";
import { CreateTagInput } from "src/types/graphql";

const mutations = {
  async createTag(
    _: any,
    createTagInput: CreateTagInput,
    { prisma }: ApolloContext,
  ) {
    let newTag: Prisma.TagCreateInput = {
      name: createTagInput.name,
      description: createTagInput.description,
    };
    const tag: Tag = await prisma.tag.create({ data: newTag });
    return tag;
  },
};

export default mutations;
