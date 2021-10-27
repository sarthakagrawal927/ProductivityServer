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
    description: String!
    generic: [Generic]
  }

  type Generic {
    id: String!
    name: String!
    description: String!
    tags: [Tag]
    task: Task
    goal: Goal
    habit: Habit
    journal: Journal
    project: Project
  }

  type Journal {
    id: String!
    base: Generic!
    type: Type!
  }

  type Task {
    id: String!
    base: Generic!
    deadline: DateTime
    priority: Priority
    predictedHours: Float
    TimeSlot: TimeSlot
  }

  type Goal {
    id: String!
    base: Generic!
    why: String!
    relevance: String!
    predictedTimeline: [TimeSlot]
  }

  type Habit {
    id: String!
    base: Generic!
    startDate: DateTime
    trackRecord: [Boolean]
    timeSlot: [TimeSlot]
  }

  type TimeSlot {
    id: String!
    start: DateTime!
    end: DateTime!
    name: String
    task: Task
  }

  type Project {
    id: String!
    base: Generic!
    tasks: [Task]
  }

  type Query {
    allUsers: [User]
  }
`;

export default typeDefs;
