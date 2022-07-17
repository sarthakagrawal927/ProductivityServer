import { ApolloContext } from "../../../context";
import { Habit, MutationResolvers } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, Habit> = {
	async createHabit(_, { createHabitInput }, { prisma }: ApolloContext) {
		const habit: Habit = await prisma.habit.create({
			data: {
				name: createHabitInput.name,
				description: createHabitInput.description,
				startDate: createHabitInput?.startDate,
				userId: createHabitInput?.userID,
				tagIDs: createHabitInput?.tagIds,
			});
		return habit;
	},
};

export default mutations;
