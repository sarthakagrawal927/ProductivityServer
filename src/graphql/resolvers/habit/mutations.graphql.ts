import { ApolloContext } from "../../../context";
import { Habit, MutationResolvers } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, Habit> = {
	// async createHabit(_, { createHabitInput }, { prisma }: ApolloContext) {
	// 	const habit: Habit = await prisma.habit.create({
	// 		data: {
	// 			generic: {
	// 				create: {
	// 					name: createHabitInput.name,
	// 					description: createHabitInput.description,
	// 				},
	// 			},
	// 			startDate: createHabitInput?.startDate,
	// 			trackRecord: createHabitInput?.trackRecord,
	// 			timeSlot: {
	// 				create: {
	// 					end: createHabitInput?.timeSlot?.end,
	// 					start: createHabitInput?.timeSlot?.start,
	// 					name: createHabitInput?.timeSlot?.name,
	// 				},
	// 			},
	// 			user: {
	// 				connect: {
	// 					id: createHabitInput?.userID,
	// 				},
	// 			},
	// 		},
	// 	});
	// 	return habit;
	// },
};

export default mutations;
