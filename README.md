# Productivity

## Tech Stack

Database: PostgreSQL

ORM: Prisma

Backend: GraphQL-Apollo, Node

Frontend: NextJS & iOS or React-Native

Frontend:StateManagement - Redux, Redux-Toolkit

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

// returns the time table & tasks for the day, maybe just get this in get User request
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

## Project Setup

Go to client:

```bash
yarn # to install dependencies
yarn dev # start the server
```

Go to server:

```bash
yarn # to install dependencies
npx prisma generate # updating prisma types in client
npx prisma migrate dev # updating prisma types in the database
yarn dev # start the server
```

## Debugging

To kill the port if EADDRINUSE error:

```bash
npx kill-port PORT
```

Checking the DB:

```bash
npx prisma studio
```

Regenerating DB:

```bash
npx prisma migrate
```
