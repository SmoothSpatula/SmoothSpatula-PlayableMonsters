-- MacrobicPredator v1.0.0
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorPortraitSmall.png")
local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorSkill.png")

local portrait_sprite = gm.sprite_add(portrait_path, 1, false, false, 0, 0)
local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
local skills_sprite = gm.sprite_add(skills_path, 1, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(gm.constants.sMacGSpawn)
local idle_sprite = gm.sprite_duplicate(gm.constants.sMacGIdle)
local walk_sprite = gm.sprite_duplicate(gm.constants.sMacGShoot2_1)
local attack_sprite0 = gm.sprite_duplicate(gm.constants.sMacGShoot1_1)
local attack_sprite1 = gm.sprite_duplicate(gm.constants.sMacGShoot1_2)
local attack_sprite2 = gm.sprite_duplicate(gm.constants.sMacGShoot1_3)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
-- local special_sprite = gm.sprite_duplicate(822)
-- local utility_sprite = gm.sprite_duplicate(823)
-- local secondary_sprite = gm.sprite_duplicate(826)
local death_sprite = gm.sprite_duplicate(gm.constants.sMacGDeath)
local jump_sprite = gm.sprite_duplicate(gm.constants.sMacGJump)
local jumpfall_sprite = gm.sprite_duplicate(gm.constants.sMacGFall)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)

--local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)

gm.sprite_set_offset(loadout_sprite, 80, -90)

gm.sprite_set_speed(idle_sprite, 1, 1)
gm.sprite_set_speed(attack_sprite0, 1, 1)
gm.sprite_set_speed(attack_sprite1, 1, 1)
gm.sprite_set_speed(attack_sprite2, 1, 1)
gm.sprite_set_speed(walk_sprite, 0.75, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local MacrobicPredator_id = -1
local MacrobicPredator = nil

MacrobicPredator, MacrobicPredator_id = setup_survivor(
    "SmoothSpatula", "MacrobicPredator", "Macrobic Predator", "Some kind of massive insect.", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite, jumpfall_sprite, nil,
    {["r"]=160, ["g"] = 115, ["b"] = 116}, {[1] = 0.0, [2] = - 20.0, [3] = 3.0}
)

setup_skill(MacrobicPredator.skill_family_z[0], "Primary attack", "Big tongue", 
    skills_sprite, 1, attack_sprite0, 
    0.0, 1.0, true, 188)

    setup_skill(MacrobicPredator.skill_family_x[0], "Primary attack", "Big tongue", 
    skills_sprite, 1, attack_sprite1, 
    0.0, 1.0, true, 188)
setup_empty_skill(MacrobicPredator.skill_family_c[0])
setup_skill(MacrobicPredator.skill_family_v[0], "Primary attack", "Big tongue", 
    skills_sprite, 1, attack_sprite2, 
    0.0, 1.0, true, 189)

-- == Callback == -- 

-- fix damage multi
gm.pre_script_hook(gm.constants.fire_explosion, function(self, other, result, args) -- scale 
    if self.class == MacrobicPredator_id then
        args[4].value = 6.0 -- damage multi
    end
end)
