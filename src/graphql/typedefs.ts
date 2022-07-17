import { gql } from "apollo-server";
/* 	
enum JournalType {
		GRATITUDE
		EVENT
		IDEA
		LEARNING
	}

	enum Priority {
		TOP
		HIGH
		MEDIUM
		LOW
		MAYBE
	}

	enum Status {
		NEW
		PENDING
		PROGRESSING
		COMPLETED
		BLOCKED
	}
 */

// here only the fields you want to query in future
const typeDefs = gql`
	scalar DateTime

	type User {
		id: String!
		name: String!
		email: String!
		journals: [Journal]
		goals: [Goal]
		habits: [Habit]
		tasks: [Task]
	}

	type Tag {
		id: String!
		name: String!
		description: String
		journals: [Journal]
		goals: [Goal]
		habits: [Habit]
		tasks: [Task]
	}

	type Journal {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		journalType: String!
	}

	type Task {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		deadline: DateTime
		priority: String!
		predictedHours: Float
		status: String!
	}

	type Goal {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		why: String
		relevance: String
	}

	type Habit {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		startDate: DateTime
		trackRecord: String
	}

	type Query {
		getUser(id: String!): User
		getUsers: [User]
		getTags: [Tag]
		getHabit(id: String!): Habit
		getJournal(id: String!): Journal
		getGoal(id: String!): Goal
		getTask(id: String!): Task
	}

	input CreateUserInput {
		name: String!
		email: String!
		password: String!
	}

	input CreateTagInput {
		name: String!
		description: String
	}

	input TimeSlotInput {
		start: DateTime!
		end: DateTime!
		name: String
		task: CreateTaskInput
	}

	input CreateHabitInput {
		userID: String!
		name: String!
		description: String
		tags: [CreateTagInput]
		startDate: DateTime
	}

	input CreateTaskInput {
		userID: String!
		name: String!
		description: String
		tags: [CreateTagInput]
		startDate: DateTime
		deadline: DateTime
		priority: String!
		predictedHours: Float!
		status: String!
	}

	type Mutation {
		createUser(createUserInput: CreateUserInput!): User
		createTag(createTagInput: CreateTagInput!): Tag
		createHabit(createHabitInput: CreateHabitInput!): Habit
		createTask(createTaskInput: CreateTaskInput!): Task
	}
`;

export default typeDefs;

/*
	allTasks: [Task]
	allProjects: [Project]
	allHabits: [Habit]
	allJournals: [Journal]
	allGoals: [Goal]
	allTasksByTag: [Task]
	allProjectsByTag: [Project]
	allHabitsByTag: [Habit]
	allTags: [Tag]
	allJournalsByTag: [Journal]
	allGoalsByTag: [Goal]
*/
