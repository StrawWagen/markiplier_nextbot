
AddCSLuaFile()

ENT.Base = "terminator_nextbot_markinator_plier"
DEFINE_BASECLASS( ENT.Base )
ENT.PrintName = "Mark"
ENT.Spawnable = false
list.Set( "NPC", "terminator_nextbot_markinator", {
    Name = "Mark",
    Class = "terminator_nextbot_markinator",
    Category = "Terminator Nextbot",
} )

if CLIENT then
    language.Add( "terminator_nextbot_markinator", ENT.PrintName )
    return

end

ENT.IsFodder = true
ENT.CoroutineThresh = terminator_Extras.baseCoroutineThresh / 2.5

ENT.term_SoundLevelShift = 10

ENT.WalkSpeed = 85
ENT.MoveSpeed = 250
ENT.RunSpeed = 380
ENT.TERM_WEAPON_PROFICIENCY = WEAPON_PROFICIENCY_AVERAGE
ENT.AccelerationSpeed = 1500
ENT.JumpHeight = 70 * 1.5
ENT.FistDamageMul = 0.45
ENT.ThrowingForceMul = 0.5
ENT.SpawnHealth = 210
ENT.MyPhysicsMass = 150


ENT.FootstepClomping = false
