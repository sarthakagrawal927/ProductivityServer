import { ApolloContext } from "../../../context";

const queries = {
  async getTags(_parent: any, _args: any, { prisma }: ApolloContext) {
    const tags = await prisma.tag.findMany();
    return tags;
  },
};

export default queries;
