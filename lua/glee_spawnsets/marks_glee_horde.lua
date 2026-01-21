
local genericMarkCounter = "terminator_nextbot_markinator*"

local spawnSet = {
    name = "marks_glee_horde", -- unique name
    prettyName = "The Great Mark Migration",
    description = "It's like fnaf ultimate custom night all over again...",
    difficultyPerMin = "default", -- difficulty per minute
    waveInterval = "default*0.25", -- time between spawn waves
    diffBumpWhenWaveKilled = "default", -- when there's <= 1 hunter left, the difficulty is permanently bumped by this amount
    startingBudget = 20, -- so budget isnt 0
    spawnCountPerDifficulty = { 1 }, -- go up fast pls
    startingSpawnCount = 15,
    maxSpawnCount = 30,
    roundEndSound = "markinator/searching/searching (7).wav",
    roundEndSoundDSP = 133,
    roundStartSound = "markinator/searching/searching (46).wav",
    roundStartSoundDSP = 133,
    chanceToBeVotable = 5,
    spawns = {
        {
            name = "mark_angry",
            prettyName = "A Mark (Angry)",
            class = "terminator_nextbot_markinator_angry",
            spawnType = "hunter",
            difficultyCost = 0.1,
            difficultyStopAfter = { 30, 40 },
            countClass = genericMarkCounter,
            minCount = { 4 },
            postSpawnedFuncs = nil,
        },
        {
            name = "mark",
            prettyName = "A Mark",
            class = "terminator_nextbot_markinator",
            spawnType = "hunter",
            difficultyCost = 0.1,
            difficultyNeeded = { 25, 35 },
            countClass = genericMarkCounter,
            postSpawnedFuncs = nil,
        },
        {
            hardRandomChance = { 1, 3 },
            name = "markiplier", -- spawns early with a max count
            prettyName = "A Markiplier",
            class = "terminator_nextbot_markinator_plier",
            spawnType = "hunter",
            difficultyCost = { 1, 4 },
            difficultyNeeded = { 50, 100 },
            countClass = "terminator_nextbot_markinator_plier",
            maxCount = { 4 },
            postSpawnedFuncs = nil,
        },
    }
}

table.insert( GLEE_SPAWNSETS, spawnSet )


