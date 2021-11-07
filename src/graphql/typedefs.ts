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
		VERY_HIGH
		HIGH
		MEDIUM
		LOW
		VERY_LOW
	}

	enum Status {
		NEW
		PENDING
		IN_PROGRESS
		COMPLETED
		BLOCKED
	}

	type User {
		id: String!
		name: String!
		email: String!
		plansForTomorrow: [TimeSlot]
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
		generic: [Generic]
	}

	type Generic {
		id: String!
		name: String!
		description: String
		tags: [Tag]
		task: Task
		goal: Goal
		habit: Habit
		journal: Journal
		project: Project
	}

	type Journal {
		id: String!
		generic: Generic!
		type: JournalType!
	}

	type Task {
		id: String!
		generic: Generic!
		deadline: DateTime!
		priority: Priority!
		predictedHours: Float
		status: Status!
		TimeSlot: TimeSlot
	}

	type Goal {
		id: String!
		generic: Generic!
		why: String
		relevance: String
		predictedTimeline: [TimeSlot]
	}

	type Habit {
		id: String!
		generic: Generic!
		startDate: DateTime
		trackRecord: String
		timeSlot: [TimeSlot]
	}

	type Project {
		id: String!
		generic: Generic!
		tasks: [Task]
	}

	type TimeSlot {
		id: String!
		start: DateTime!
		end: DateTime!
		task: Task
		name: String
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

	input CreateGenericInput {
		name: String!
		description: String
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
		deadline: DateTime!
		priority: Priority!
		predictedHours: Float
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
    everythingByTag: [User]
*/
