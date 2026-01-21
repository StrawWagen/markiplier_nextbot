
if game.IsDedicated() then
    RunConsoleCommand( "markiplier_nextbot_dynamiccontent", 1 )

end

local markSpawnSet = {
    name = "marks_glee_wraiths", -- unique name
    prettyName = "Mar- Where did he go?",
    description = "Alot of cloaking... marks... Is mark a animatronic!?",
    difficultyPerMin = "default", -- difficulty per minute
    waveInterval = "default", -- time between spawn waves
    diffBumpWhenWaveKilled = "default", -- when there's <= 1 hunter left, the difficulty is permanently bumped by this amount
    startingBudget = "default", -- so budget isnt 0
    spawnCountPerDifficulty = "default", -- max of ten at 10 minutes
    startingSpawnCount = "default",
    maxSpawnCount = "default",
    maxSpawnDist = "default",
    roundEndSound = "default",
    roundStartSound = "default",
    chanceToBeVotable = 15,
    spawns = {
        {
            name = "mark_wraith",
            prettyName = "A Mark (Wraith)",
            class = "terminator_nextbot_markinator_wraith",
            spawnType = "hunter",
            difficultyCost = { 5, 10 },
            countClass = "terminator_nextbot_markinator_wraith",
            minCount = { 2 },
            postSpawnedFuncs = nil,
        },
    }
}

table.insert( GLEE_SPAWNSETS, markSpawnSet )
