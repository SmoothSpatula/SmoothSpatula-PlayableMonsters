-- ImpOverlord v1.0.2
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")
survivor_setup = require("./survivor_setup")
mods.on_all_mods_loaded(function() for k, v in pairs(mods) do if type(v) == "table" and v.hfuncs then Helper = v end end end)

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPortraitSmall.png")

local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "skillsicons.png")
-- local jump_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "sCandymanjump.png")
-- local jumpfall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "sCandymanjumpfall.png")
-- local hit_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "sCandymanhit.png")

local palette_path = path.combine(_ENV["!plugins_mod_folder_path"], "sImpOverlordPAL.png")


local portrait_sprite = gm.sprite_add(portrait_path, 1, false, false, 0, 0)
local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
local skills_sprite = gm.sprite_add(skills_path, 4, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(808)
local idle_sprite = gm.sprite_duplicate(812)
local walk_sprite = gm.sprite_duplicate(814)
local attack_sprite = gm.sprite_duplicate(818)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
local special_sprite = gm.sprite_duplicate(822)
local utility_sprite = gm.sprite_duplicate(823)
local secondary_sprite = gm.sprite_duplicate(826)
local death_sprite = gm.sprite_duplicate(828)
-- local jump_sprite = gm.sprite_add(jump_path, 1, false, false, 29, 45)
-- local jumpfall_sprite = gm.sprite_add(jumpfall_path, 1, false, false, 29, 45)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)


local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)

gm.sprite_set_offset(idle_sprite, 70, 107)
gm.sprite_set_speed(idle_sprite, 1, 1)
gm.sprite_set_offset(attack_sprite, 50, 113)
gm.sprite_set_speed(attack_sprite, 1, 1)
gm.sprite_set_offset(walk_sprite, 70, 95)
gm.sprite_set_speed(walk_sprite, 1, 1)
gm.sprite_set_offset(special_sprite, 38, 100)
gm.sprite_set_speed(special_sprite, 1, 1)
gm.sprite_set_offset(utility_sprite, 50, 113)
gm.sprite_set_speed(utility_sprite, 1, 1)
gm.sprite_set_offset(secondary_sprite, 50, 110)
gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_offset(loadout_sprite, 40, -50)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_offset(death_sprite, 90, 187)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local ImpOverlord_id = -1
local ImpOverlord = nil
local is_init = false

local id, identifier = ... or {}

ImpOverlord, ImpOverlord_id = setup_survivor(
    "SmoothSpatula", "ImpOverlord", "Imp Overlord", "The <y>Imp Overlord<w> has had enough of dying to the countless survivors invading his home. It is time for him to join the battle, unleashing an <y>Army of Imps<w> upon the land.", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, palette_sprite,
    walk_sprite, idle_sprite, death_sprite,
    gm.make_colour_rgb(255, 20, 50), {[1] = -12.0, [2] = - 55.0, [3] = 3.0}
)

setup_skill(ImpOverlord.skill_family_z[0], "Imp Slash", "Slash ennemies with your claws, dealing <y>3 x 200% damage<w>.", 
    skills_sprite, 0, attack_sprite, 
    0.0, 2.0, true, 170)
