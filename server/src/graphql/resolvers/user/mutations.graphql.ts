import { ApolloContext } from "../../../context";
import bcrypt from "bcryptjs";
import { Prisma, User } from "@prisma/client";

const mutations = {
  async createUser(
    _: any,
    { createUserInput }: any,
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
