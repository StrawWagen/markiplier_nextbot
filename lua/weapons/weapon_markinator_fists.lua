AddCSLuaFile()

SWEP.Base = "weapon_terminatorfists_term"
DEFINE_BASECLASS(SWEP.Base)

SWEP.PrintName = "Mark's Fists"
SWEP.Spawnable = false
SWEP.Author = "Boomertaters"
SWEP.Purpose = "Innate weapon that the markinator uses..."

local className = "weapon_markinator_fists"
if CLIENT then
    language.Add(className, SWEP.PrintName)
    killicon.Add(className, "vgui/hud/killicon/" .. className .. ".png", color_white)
end