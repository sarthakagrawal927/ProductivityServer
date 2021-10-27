# Productivity

## Tech Stack

Database: PostgreSQL
ORM: Prisma
Backend: GraphQL-Apollo, Node

Frontend: NextJS
Frontend:StateManagement - Recoil

## Endpoints

```js

// CRUD

/habit/:habitID
/tag/:tagID
/project/:projectID
/journal/:journalID
/task/:taskID
/goal/:goalID
/timeSlot/:timeSlotID

// GET

// returns the time table & tasks for the day
/today/
/tomorrow/
/date/:date

// returns everything related to that tag
/tags/:tagID

// get all
/habits/
/tags/
/projects/
/journals/
/tasks/
/goals/

```

## Sample query (Probable)

```graphql
    query{
        user{
            habit{
                generic{
                    select: tag in tags
                }
            }
        }
    }
```
