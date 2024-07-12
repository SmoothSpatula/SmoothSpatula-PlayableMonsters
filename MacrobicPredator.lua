-- MacrobicPredator v1.0.0
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")
survivor_setup = require("./survivor_setup")

-- ========== Sprite ========== 

-- local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPortrait.png")
-- local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPortraitSmall.png")

-- local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "skillsicons.png")

-- local palette_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPAL.png")

local portrait_sprite = gm.sprite_duplicate(gm.constants.sMacGIdle)
-- local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
-- local skills_sprite = gm.sprite_add(skills_path, 4, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(gm.constants.sMacGSpawn)
local idle_sprite = gm.sprite_duplicate(gm.constants.sMacGIdle)
local walk_sprite = gm.sprite_duplicate(gm.constants.sMacGShoot2_1)
local attack_sprite = gm.sprite_duplicate(gm.constants.sMacGShoot1_1)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
-- local special_sprite = gm.sprite_duplicate(822)
-- local utility_sprite = gm.sprite_duplicate(823)
-- local secondary_sprite = gm.sprite_duplicate(826)
local death_sprite = gm.sprite_duplicate(gm.constants.sMacGDeath)
local jump_sprite = gm.sprite_duplicate(gm.constants.sMacGJump)
local jumpfall_sprite = gm.sprite_duplicate(gm.constants.sMacGFall)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)

local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)

gm.sprite_set_offset(loadout_sprite, 80, -60)

gm.sprite_set_speed(idle_sprite, 1, 1)
gm.sprite_set_speed(attack_sprite, 1, 1)
gm.sprite_set_speed(walk_sprite, 1, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local MacrobicPredator_id = -1
local MacrobicPredator = nil
local is_init = false

local id, identifier = ... or {}

MacrobicPredator, MacrobicPredator_id = setup_survivor(
    "SmoothSpatula", "MacrobicPredator", "Macrobic Predator", "Some kind of massive insect.", "...",
    loadout_sprite, loadout_sprite, loadout_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite,
    {["r"]=168, ["g"] = 156, ["b"] = 163}, {[1] = -12.0, [2] = - 55.0, [3] = 3.0}
)

setup_skill(MacrobicPredator.skill_family_z[0], "Primary attack", "Big tongue thingy", 
    0, 0, attack_sprite, 
    0.0, 5.0, true, 188)

setup_empty_skill(MacrobicPredator.skill_family_x[0])
setup_empty_skill(MacrobicPredator.skill_family_c[0])
setup_empty_skill(MacrobicPredator.skill_family_v[0])
