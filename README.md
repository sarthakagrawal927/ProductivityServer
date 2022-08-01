# Productivity

[Archived] - Will be making this project in different tech stack

## Tech Stack

Database: PostgreSQL (MongoDB might be a better choice here)

ORM: Prisma

Backend: GraphQL-Apollo, Node

Frontend: NextJS & iOS or React-Native

Frontend:StateManagement - Redux, Redux-Toolkit

## Endpoints

```js

// CRUD [STATUS]

/user/:userID  [CREATE ✅, READ ✅, UPDATE]
/tag/:tagID  [CREATE ✅, UPDATE, DELETE]
/timeSlot/:timeSlotID  [CREATE, UPDATE, DELETE]

/habit/:habitID  [CREATE ✅, READ, UPDATE, DELETE]
/project/:projectID  [CREATE, READ, UPDATE, DELETE]
/journal/:journalID  [CREATE, READ, UPDATE, DELETE]
/task/:taskID  [CREATE ✅, READ, UPDATE, DELETE]
/goal/:goalID  [CREATE, READ, UPDATE, DELETE]

// GET

// returns the time table & tasks for the day, maybe just get this in get User request
/today/
/tomorrow/
/date/:date

// returns everything related to that tag
/tags/:tagID

// get all
/users/ ✅
/habits/
/tags/ ✅
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

## Project Setup

```bash
yarn # to install dependencies
npx prisma generate # updating prisma types in client
npx prisma migrate dev # updating prisma types in the database
yarn dev # start the server
```

## Debugging

To kill the port if EADDRINUSE error:

```bash
npx kill-port 4000
```

Checking the DB:

```bash
npx prisma studio
```

Regenerating DB:

```bash
npx prisma migrate
```
