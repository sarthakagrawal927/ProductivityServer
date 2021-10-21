# Productivity

## DB

```ts
type user = {
    name:string,
    email:string,
    phone: string,
    // andMore,
    habit:[habit]
    idea:[idea]
    task:[task]
    learning:[learning]
    event:[event]
    goal:[goal]
    planForTomorrow:[planForTomorrow]
}

type generic={
    name: string,
    desc: string,
    id:string,
    tags: [tag],
}

type gratitude = {
    basic: generic,
}

type idea= {
    basic: generic,
}

type event = {
    basic: generic,
}

type learning = {
    basic: generic,
}

type task= {
    basic: generic,
    deadline: Date,
    priority: enum(0,1,2,4,5)
}

type goal = {
    basic: generic,
    why: string,
    relevance: string
    timeline: [task]
}

type habit = {
    basic: generic,
    startDate: Date,
    track = [Boolean] // success or false from day of start
}

type planForTomorrow = {
    slot: [string] // length 24 or multiple or 24
}

```

## Endpoints

```js

/api/habit/:habit

/tags/:tag

/today
/tomorrow

```
