import { ApolloContext } from "../../../context";
import { Task, MutationResolvers } from "../../../types/graphql";
import { Prisma } from "@prisma/client";

const mutations: MutationResolvers<ApolloContext, Task> = {
	async createTask(_, { createTaskInput }, { prisma }: ApolloContext) {
		console.log(createTaskInput);
		const newTask: Prisma.TaskCreateInput = {
			name: createTaskInput?.name,
			description: createTaskInput?.description,
			deadline: createTaskInput?.deadline,
			priority: createTaskInput?.priority,
			status: createTaskInput?.status,
			predictedHours: createTaskInput?.predictedHours,
			userId: createTaskInput?.userId,
		};

		console.log(newTask);

		const task: Task = await prisma.task.create({
			data: newTask,
		});
		return task;
	},
};

export default mutations;
