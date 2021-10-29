import { ApolloContext } from "../../../context";
import bcrypt from "bcryptjs";
import { Prisma, User } from "@prisma/client";
import { CreateUserInput } from "src/types/graphql";
const mutations = {
  async createUser(
    _: any,
    createUserInput: CreateUserInput,
    { prisma }: ApolloContext,
  ) {
    const password = await bcrypt.hash(createUserInput.password, 12);
    let newUser: Prisma.UserCreateInput = {
      email: createUserInput.email,
      name: createUserInput.name,
      password: password,
    };
    const user: User = await prisma.user.create({ data: newUser });
    return user;
  },
};

export default mutations;
