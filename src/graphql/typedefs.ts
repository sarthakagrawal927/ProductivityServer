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
		planForTomorrow: [TimeSlot]
		journals: [Journal]
		goals: [Goal]
		habits: [Habit]
		tasks: [Task]
		projects: [Project]
	}

	type Tag {
		id: String!
		name: String!
		description: String
		journals: [Journal]
		goals: [Goal]
		habits: [Habit]
		tasks: [Task]
		projects: [Project]
	}

	type TimeSlot {
		id: String!
		start: DateTime!
		end: DateTime!
		task: Task
		name: String
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
		predictedHours: Float
		status: Status
		timeSlot: TimeSlot
	}

	type Goal {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		why: String
		relevance: String
		predictedTimeline: [TimeSlot]
	}

	type Habit {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		startDate: DateTime
		trackRecord: String
		timeSlot: [TimeSlot]
	}

	type Project {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		tasks: [Task]
	}

	type Query {
		getUser(id: String!): User
		getUsers: [User]
		getTags: [Tag]
		getHabit(id: String!): Habit
		getJournal(id: String!): Journal
		getProject(id: String!): Project
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
		trackRecord: String
		timeSlot: TimeSlotInput
	}

	input CreateTaskInput {
		userID: String!
		name: String!
		description: String
		tags: [CreateTagInput]
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
