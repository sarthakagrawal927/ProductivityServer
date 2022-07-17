import { ApolloContext } from "../../../context";
import { Habit, MutationResolvers } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, Habit> = {
	async createHabit(_, { createHabitInput }, { prisma }: ApolloContext) {
		console.log(createHabitInput);
		const habit: Habit = await prisma.habit.create({
			data: {
				name: createHabitInput.name,
				description: createHabitInput.description,
				startDate: createHabitInput?.startDate,
				user: {
					connect: {
						id: createHabitInput.userID,
					},
				}
			},
		});
		return habit;
	},
};

export default mutations;
