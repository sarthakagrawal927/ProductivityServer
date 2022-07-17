import { gql } from "apollo-server";

// here only the fields you want to query in future
const typeDefs = gql`
	scalar DateTime

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

	type User {
		id: String!
		name: String!
		email: String!
		planForTomorrow: [Task]
		journals: [Journal]
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

	type TimeSlot {
		id: String!
		start: DateTime!
		end: DateTime!
	}

	type Journal {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		journalType: JournalType!
	}

	type Task {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		deadline: DateTime
		priority: Priority!
		status: Status!
		predictedHours: Float
		timeSlot: TimeSlot
	}

	type Goal {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		why: String
		relevance: String
		tasks: [Task]
	}

	type Habit {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		startDate: DateTime
		trackRecord: String
		tasks: [Task]
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
	}

	input CreateHabitInput {
		userID: String!
		name: String!
		description: String
		tagIds: [String]
		startDate: DateTime
		timeSlot: TimeSlotInput
	}

	input CreateTaskInput {
		userID: String!
		name: String!
		description: String
		tags: [String]!
		startDate: DateTime
		deadline: DateTime
		priority: Priority!
		predictedHours: Float!
		status: Status!
		timeSlot: TimeSlotInput
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
	allHabits: [Habit]
	allJournals: [Journal]
	allGoals: [Goal]
	allTasksByTag: [Task]
	allHabitsByTag: [Habit]
	allTags: [Tag]
	allJournalsByTag: [Journal]
	allGoalsByTag: [Goal]
*/
