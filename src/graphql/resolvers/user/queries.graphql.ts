import { ApolloContext } from "../../../context";

const queries = {
  async getUser(_parent: any, args: { id: string }, { prisma }: ApolloContext) {
    const user = await prisma.user.findUnique({
      where: {
        id: args.id,
      },
      include: {
        Habit: {
          include: {
            tags: true
          }
        },
      }
    });

    console.log({ user })

    return user;
  },

  // testing query
  async getUsers(_parent: any, _args: any, { prisma }: ApolloContext) {
    const users = await prisma.user.findMany();
    return users;
  },
};

export default queries;
