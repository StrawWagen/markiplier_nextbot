local doingContent = CreateConVar( "markiplier_nextbot_dynamiccontent", 0, { FCVAR_ARCHIVE, FCVAR_REPLICATED }, "Dynamically request the mark sounds whenever a bot is spawned?" )

if not SERVER then return end

if not doingContent:GetBool() then -- this will only work after a server restart with the new convar!
    resource.AddWorkshop( "3649571290" ) -- bot ( sounds ) 
    resource.AddWorkshop( "3151172526" ) -- playermodel

end

-- credits to StrawWagen for this code

-- https://steamcommunity.com/id/StrawWagen
