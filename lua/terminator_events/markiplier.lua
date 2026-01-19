local newEvent = {
    defaultPercentChancePerMin = 0.3, 
    doesDedicationProgression = true,
    navmeshEvent = true,
    variants = {
        {
            variantName = "markMeeting",
            getIsReadyFunc = nil,
            minDedication = 0,
            maxDedication = 8,
            overrideChance = 30, -- chance to override other events
            unspawnedStuff = {
                {
                    class = "terminator_nextbot_markinator",
                    spawnAlgo = "steppedRandomRadius",
                    deleteAfterMeet = false,
                    timeout = true, -- if bot has no enemy for this long, despawns em, true means it sets to the default, 30 min
                }
            },
            thinkInterval = nil, -- makes it default to terminator_Extras.activeEventThinkInterval
            concludeOnMeet = false,
        },
        {
            variantName = "markiplierMeeting",
            getIsReadyFunc = nil,
            minDedication = 6,
            maxDedication = 12,
            overrideChance = 25,
            unspawnedStuff = {
                {
                    class = "terminator_nextbot_markinator_plier",
                    spawnAlgo = "steppedRandomRadius",
                    deleteAfterMeet = false,
                    timeout = true,
                }
            },
            thinkInterval = nil,
            concludeOnMeet = false,
        },
    }
}

terminator_Extras.RegisterEvent( newEvent, "markiplier" )