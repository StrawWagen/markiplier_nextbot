local markSpawnSet = {
    name = "marks_glee_oneguy", -- unique name
    prettyName = "One Gleeful Mark",
    description = "One random mark... Who is it? You have to find out...",
    difficultyPerMin = "default", -- difficulty per minute
    waveInterval = "default", -- time between spawn waves
    diffBumpWhenWaveKilled = "default", -- when there's <= 1 hunter left, the difficulty is permanently bumped by this amount
    startingBudget = "default", -- so budget isnt 0
    spawnCountPerDifficulty = "default", -- max of ten at 10 minutes
    startingSpawnCount = 1,
    maxSpawnCount = 1,
    maxSpawnDist = { 4500, 6500 },
    roundEndSound = "default",
    roundStartSound = "default",
    chanceToBeVotable = 5,
    spawns = {
        {
            hardRandomChance = nil,
            name = "markglee", -- unique name
            prettyName = "The Mark",
            class = "terminator_nextbot_markinator", -- class spawned
            spawnType = "hunter",
            difficultyCost = { 5 },
            countClass = "terminator_nextbot_markinator*", -- class COUNTED
            maxCount = 1,
            postSpawnedFuncs = nil,
        },
        {
            hardRandomChance = nil,
            name = "markangryglee",
            prettyName = "The Mark (Angry)",
            class = "terminator_nextbot_markinator_angry",
            spawnType = "hunter",
            difficultyCost = { 25, 35 },
            countClass = "terminator_nextbot_markinator*",
            maxCount = 1,
            postSpawnedFuncs = nil,
        },
        {
            hardRandomChance = nil,
            name = "markiplierglee",
            prettyName = "The Markiplier",
            class = "terminator_nextbot_markinator_plier",
            spawnType = "hunter",
            difficultyCost = { 50, 100 },
            countClass = "terminator_nextbot_markinator*",
            maxCount = 1,
            postSpawnedFuncs = nil,
        },
    }
}

table.insert( GLEE_SPAWNSETS, markSpawnSet )
