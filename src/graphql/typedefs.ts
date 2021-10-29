import { gql } from "apollo-server";

// here only the fields you want to query in future
const typeDefs = gql`
  scalar DateTime

  enum Type {
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
    id: String
    name: String
    email: String
    plansForTomorrow: [TimeSlot]
    journals: [Journal]
    goals: [Goal]
    habits: [Habit]
    tasks: [Task]
    projects: [Project]
  }

  type Tag {
    id: String
    name: String!
    description: String
    generic: [Generic]
  }

  type Generic {
    id: String
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
    id: String
    base: Generic!
    type: Type!
  }

  type Task {
    id: String
    base: Generic!
    deadline: DateTime
    priority: Priority
    predictedHours: Float
    TimeSlot: TimeSlot
  }

  type Goal {
    id: String
    base: Generic!
    why: String
    relevance: String
    predictedTimeline: [TimeSlot]
  }

  type Habit {
    id: String
    base: Generic!
    startDate: DateTime
    trackRecord: String
    timeSlot: [TimeSlot]
  }

  type TimeSlot {
    id: String
    start: DateTime!
    end: DateTime!
    task: Task
  }

  type Project {
    id: String
    base: Generic!
    tasks: [Task]
  }

  type Query {
    getUser(id: String!): User
    getUsers: [User]
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

  type Mutation {
    createUser(createUserInput: CreateUserInput!): User
    createTag(createTagInput: CreateTagInput!): Tag
    createHabit(createHabitInput: CreateHabitInput!): Habit
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
