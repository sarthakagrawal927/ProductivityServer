import { ApolloContext } from "../../../context";
import { Prisma, Habit } from "@prisma/client";
import { CreateHabitInput } from "src/types/graphql";
const mutations = {
  async createHabit(
    _: any,
    createHabitInput: CreateHabitInput,
    { prisma }: ApolloContext,
  ) {
    const newHabit: Prisma.HabitCreateInput = {
      base: {
        create: {
          name: createHabitInput.name,
          description: createHabitInput.description,
        },
      },
      startDate: createHabitInput.startDate,
      trackRecord: createHabitInput.trackRecord,
      timeSlot: {
        create: {
          end: createHabitInput.timeSlot?.end,
          start: createHabitInput.timeSlot?.start,
          name: createHabitInput.timeSlot?.name,
        },
      },
      user: {
        connect: {
          id: createHabitInput.userID,
        },
      },
    };

    const Habit: Habit = await prisma.habit.create({ data: newHabit });
    return Habit;
  },
};

export default mutations;
