import { ApolloContext } from "../../../context";
import { Task, MutationResolvers } from "../../../types/graphql";

const mutations: MutationResolvers<ApolloContext, Task> = {
	async createTask(_, { createTaskInput }, { prisma }: ApolloContext) {
		const task: Task = await prisma.task.create({
			data: {
				name: createTaskInput?.name,
				description: createTaskInput?.description,
				deadline: createTaskInput?.deadline,
				priority: createTaskInput?.priority,
				status: createTaskInput?.status,
				predictedHours: createTaskInput?.predictedHours,
				user: {
					connect: {
						id: createTaskInput?.userID,
					},
				},
			},
		});
		return task;
	},
};

export default mutations;
