-- SOUNDS CREDIT TO THE MARKIPLIER TFA VOXS AND THE LAMBDA/ZETA MARKIPLIER SOUNDS!!
-- GO AWARD THEM!!!
-- credits to Straw W Wagen for the jerma nextbot AND the terminator nextbot...
-- and finally... credit to the market plier...

AddCSLuaFile()

ENT.Base = "terminator_nextbot"
DEFINE_BASECLASS( ENT.Base )
ENT.PrintName = "Markiplier"
ENT.Spawnable = false
ENT.Author = "Boomertaters"
list.Set( "NPC", "terminator_nextbot_markinator_plier", {
    Name = "Markiplier",
    Class = "terminator_nextbot_markinator_plier",
    Category = "Terminator Nextbot",
} )

ENT.MySpecialActions = { -- binds 
    ["markinator_speak"] = {
        inBind = IN_RELOAD,
        drawHint = true,
        name = "Speak",
        desc = "Speak a line",
        ratelimit = 1, -- seconds between uses
        svAction = function( _drive, _driver, bot )
            bot:RunTask( "SpeakALine" )

        end,
    }
}

-- everything below here is basically copied from the jerma985 nextbot
if CLIENT then
    language.Add( "terminator_nextbot_markinator_plier", ENT.PrintName )

    local contentVar = GetConVar( "markiplier_nextbot_content" )
    local gotPMContent
    local attempts = 0

    function ENT:AdditionalClientInitialize() -- people who join in with this already spawned are screwed lol
        if not contentVar:GetBool() then return end

        if attempts >= 2 then return end -- just in case

        if not gotPMContent then
            attempts = attempts + 1
            steamworks.DownloadUGC( "3151172526", function( path )
                if not path then return end
                gotPMContent = game.MountGMA( path )

            end )
        end
    end
    return

end

local MARKINATOR_MODEL = "models/humans/gfreakman/markiplier.mdl"
ENT.ARNOLD_MODEL = MARKINATOR_MODEL

ENT.Models = { MARKINATOR_MODEL }

ENT.TERM_FISTS = "weapon_markinator_fists"

ENT.CoroutineThresh = terminator_Extras.baseCoroutineThresh * 1.85 -- it's big brain time

ENT.term_SoundPitchShift = 0
ENT.term_SoundLevelShift = 20
ENT.CanSpeak = true
ENT.NextTermSpeak = 0

ENT.FistDamageMul = 1.5
ENT.SpawnHealth = 1250
ENT.HealthRegen = 1.5
ENT.HealthRegenInterval = 0.30

ENT.MetallicMoveSounds = false
ENT.DoMetallicDamage = false
ENT.CanSwim = true
ENT.BreathesAir = true

function ENT:AdditionalInitialize()
    self.isTerminatorHunterChummy = "mark"
    self.potentialManiac = math.random( 0, 100 ) < 30

end

local markSounds
local soundLocation = "markinator/"

local function doSounds()
    markSounds = {}
    local count = 0

    local _, dirs = file.Find( "sound/" .. soundLocation .. "*", "GAME" )
    for _, dir in ipairs( dirs or {} ) do
        local searchPath = "sound/" .. soundLocation .. dir .. "/*"
        local found = file.Find( searchPath, "GAME" )
        markSounds[dir] = {}
        for _, path in ipairs( found ) do
            local truePath = soundLocation .. dir .. "/" .. path
            table.insert( markSounds[dir], truePath )
            count = count + 1

        end
    end

    print( "loaded " .. count .. " markiplier sounds" )

end

doSounds()

function ENT:mark_SpeakARandomSound( directory )
    local inDir = markSounds[directory]
    local randSnd = inDir[ math.random( 1, #inDir ) ]

    self:Term_SpeakSound( randSnd )

end

local function randomMarkSoundPath( directory )
    local inDir = markSounds[directory]
    return inDir[ math.random( 1, #inDir ) ]

end

ENT.MyClassTask = {
    StartsOnInitialize = true,
    OnCreated = function( self, data )
        self:Term_SpeakSoundNow( randomMarkSoundPath( "spawned" ) )

    end,
    EnemyLost = function( self, data )
        self:mark_SpeakARandomSound( "searching" )
    end,
    SpeakALine = function ( self, data )
        local path = "idle"
        if self:IsReallyAngry() then
            path = "anger"

        end
        self:Term_SpeakSoundNow( randomMarkSoundPath( path ) )

    end,
    EnemyFound = function( self, data, enemy, sinceLastFound )
        if sinceLastFound < 10 then return end
        local path = "idle"
        if self:IsReallyAngry() then
            path = "anger"

        end
        self:mark_SpeakARandomSound( path )
    end,
    StartStaring = function( self, data )
        local nextLine = data.nextStareLine or 0
        if nextLine > CurTime() then return end
        data.nextStareLine = CurTime() + 5
        self:mark_SpeakARandomSound( "searching" )
    end,
    OnAttack = function( self, data )
        if self:IsFists() then
            local toleranceTime = data.punchToleranceTime or 0
            local tolerance = toleranceTime - CurTime()
            local increment = 10
            if self:IsReallyAngry() then -- he doesn't do funny stuff when he's mad :(
                increment = 40

            elseif self:IsAngry() then
                increment = 20

            end
            if math.random( 1, increment ) < tolerance then return end

            data.punchToleranceTime = math.max( toleranceTime + increment / 2, CurTime() + increment )
            self:Term_SpeakSoundNow( randomMarkSoundPath( "effort" ) )

        else
            local chance = 5
            if self:GetWeapon().terminator_ReallyLikesThisOne then
                chance = 50

            end
            if math.random( 1, 100 ) > chance then
                return

            end

            self:Term_SpeakSoundNow( randomMarkSoundPath( "effort" ) )

        end
    end,
    GetWeapon = function( self, data )
        if self.NextTermSpeak > CurTime() then return end
        local path = randomMarkSoundPath( "getweapon" )
        self:Term_SpeakSoundNow( path )

    end,
    OnAnger = function( self, data )
        self.mark_nextRareAngry = CurTime() + math.random( 10, 20 )
        self:mark_SpeakARandomSound( "anger" )

    end,
    OnReallyAnger = function( self, data )
        self.mark_nextRareAngry = CurTime() + math.random( 10, 20 )
        timer.Simple( 0.1, function()
            if not IsValid( self ) then return end
            self:Term_SpeakSoundNow( randomMarkSoundPath( "anger" ) )
            self:mark_SpeakARandomSound( "anger" )

        end )
    end,
    OnKillEnemy = function( self, data )
        local path = randomMarkSoundPath( "killed" )
        self:Term_SpeakSoundNow( path )

    end,
    OnJump = function( self, data, height )
        local toleranceTime = data.jumpToleranceTime or 0
        local tolerance = toleranceTime - CurTime()
        local dealt = height
        if dealt < 125 and math.random( 1, dealt ) < tolerance then return end

        data.jumpToleranceTime = math.max( toleranceTime + dealt / 2, CurTime() + dealt )
        self:Term_SpeakSoundNow( randomMarkSoundPath( "effort" ) )

    end,
    OnDamaged = function( self, data, damage )
        local toleranceTime = data.painToleranceTime or 0
        local tolerance = toleranceTime - CurTime()
        local dealt = damage:GetDamage()
        if dealt < 75 and math.random( 1, dealt ) < tolerance then return end

        data.painToleranceTime = math.max( toleranceTime + dealt / 2, CurTime() + dealt )

        self:Term_SpeakSoundNow( randomMarkSoundPath( "pain" ) )

    end,
    OnKilled = function( self, data, attacker, inflictor, ragdoll )
        local lvl = 95 + self.term_SoundLevelShift
        local pit = math.Rand( 95, 97 ) + self.term_SoundPitchShift
        local pos = self:GetShootPos()
        self:Term_SpeakSoundNow( "common/null.wav", 10 )
        local path1 = randomMarkSoundPath( "death" )
        timer.Simple( 0.75, function()
            if IsValid( ragdoll ) then
                ragdoll:EmitSound( path1, lvl, pit, 1, CHAN_VOICE )

            else
                sound.Play( path1, pos, lvl, pit, 1 )

            end
        end )
        if SoundDuration( path1 ) <= 1 then
            local path2 = randomMarkSoundPath( "death" )
            timer.Simple( 3, function()
                if path1 == path2 then return end
                if IsValid( ragdoll ) then
                    ragdoll:EmitSound( path2, lvl, pit, 1, CHAN_VOICE )

                else
                    sound.Play( path2, pos, lvl, pit, 1 )

                end
            end )
        end
    end,
    BehaveUpdatePriority = function( self, data )
        local enemy = self:GetEnemy()
        local path = self:GetPath()
        local offset = 5
        local headingToEnem = IsValid( enemy ) and path and path:GetEnd() and path:GetEnd():DistToSqr( enemy:GetPos() ) < 500^2 and path:GetLength() < 1000
        if headingToEnem then
            offset = -5

        elseif self:IsReallyAngry() then
            offset = 0

        elseif self.IsSeeEnemy and not self:primaryPathIsValid() then
            offset = 1

        elseif self:IsAngry() then
            offset = 2

        end
        local nextLine = self.NextTermSpeak + offset
        local speaking = nextLine > CurTime()

        if speaking then return end
        if not IsValid( enemy ) then
            self:mark_SpeakARandomSound( "idle" )

        else
            local rareAngry = self.mark_nextRareAngry or 0
            if self:IsAngry() and headingToEnem and rareAngry < CurTime() then
                self.mark_nextRareAngry = CurTime() + math.random( 5, 15 )
                self:mark_SpeakARandomSound( "anger" )

            else
                self:mark_SpeakARandomSound( "searching" )

            end
        end
    end,
}
