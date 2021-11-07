import { ApolloContext } from "../../../context";
import { User } from "@prisma/client";
import { CreateUserInput } from "src/types/graphql";
const mutations = {
  async createUser(
    _: any,
    createUserInput: CreateUserInput,
    { prisma }: ApolloContext,
  ) {
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
