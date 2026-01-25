
AddCSLuaFile()

ENT.Base = "terminator_nextbot_markinator"
DEFINE_BASECLASS( ENT.Base )
ENT.PrintName = "Mark (Angry)"
ENT.Spawnable = false
list.Set( "NPC", "terminator_nextbot_markinator_angry", {
    Name = "Mark (Angry)",
    Class = "terminator_nextbot_markinator_angry",
    Category = "Terminator Nextbot",
} )

if CLIENT then
    language.Add( "terminator_nextbot_markinator_angry", ENT.PrintName )
    return

end

ENT.IsFodder = false
ENT.CoroutineThresh = terminator_Extras.baseCoroutineThresh / 1

ENT.term_SoundLevelShift = 15

function ENT:IsAngry()
    return true

end

function ENT:IsReallyAngry()
    return true -- always angry


end

