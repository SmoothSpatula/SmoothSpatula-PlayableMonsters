-- Lemurian v1.0.0
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "LemurianPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "LemurianPortraitSmall.png")
local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "LemurianSkill.png")

local portrait_sprite = gm.sprite_add(portrait_path, 1, false, false, 0, 0)
local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
local skills_sprite = gm.sprite_add(skills_path, 1, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(gm.constants.sLizardSpawn)
local idle_sprite = gm.sprite_duplicate(gm.constants.sLizardIdle)
local walk_sprite = gm.sprite_duplicate(gm.constants.sLizardWalk)
--local attack_sprite = gm.sprite_duplicate(gm.constants.sMacGShoot1_1)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
-- local special_sprite = gm.sprite_duplicate(822)
-- local utility_sprite = gm.sprite_duplicate(823)
-- local secondary_sprite = gm.sprite_duplicate(826)
local climb_sprite = gm.sprite_duplicate(gm.constants.sLizardClimb)
local death_sprite = gm.sprite_duplicate(gm.constants.sLizardDeath)
local jump_sprite = gm.sprite_duplicate(gm.constants.sLizardJump)
local jumpfall_sprite = gm.sprite_duplicate(gm.constants.sLizardFall)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)

--local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)

gm.sprite_set_offset(loadout_sprite, 22, -90)

gm.sprite_set_speed(idle_sprite, 1, 1)
--gm.sprite_set_speed(attack_sprite, 1, 1)
gm.sprite_set_speed(walk_sprite, 0.75, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local Lemurian_id = -1
local Lemurian = nil

Lemurian, Lemurian_id = setup_survivor(
    "SmoothSpatula", "Lemurian", "Lemurian", "7' tall.", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite, jumpfall_sprite, climb_sprite,
    {["r"]=160, ["g"] = 115, ["b"] = 116}, {[1] = 0.0, [2] = - 20.0, [3] = 3.0}
)

setup_skill(Lemurian.skill_family_z[0], "Primary attack", "", 
    skills_sprite, 1, -1, 
    0.0, 4.0, true, 144)

setup_empty_skill(Lemurian.skill_family_x[0])
setup_empty_skill(Lemurian.skill_family_c[0])
setup_empty_skill(Lemurian.skill_family_v[0])

gm.pre_script_hook(gm.constants.fire_explosion, function(self, other, result, args) -- scale 
    if self.class == Lemurian_id then
        args[4].value = 3.0 -- damage multi
    end
end)
