-- MacrobicPredator v1.0.0
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GreaterWispPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GreaterWispPortraitSmall.png")
local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GreaterWispSkill1.png")

local portrait_sprite = gm.sprite_add(portrait_path, 1, false, false, 0, 0)
local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
local skills_sprite = gm.sprite_add(skills_path, 1, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(gm.constants.sWispGSpawn)
local idle_sprite = gm.sprite_duplicate(gm.constants.sWispGIdle)
local walk_sprite = gm.sprite_duplicate(gm.constants.sWispGIdle)
local attack_sprite0 = gm.sprite_duplicate(gm.constants.sWispGShoot1)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
-- local special_sprite = gm.sprite_duplicate(822)
-- local utility_sprite = gm.sprite_duplicate(823)
-- local secondary_sprite = gm.sprite_duplicate(826)
local death_sprite = gm.sprite_duplicate(gm.constants.sWispGDeath)
local jump_sprite = gm.sprite_duplicate(gm.constants.sWispGIdle)
local jumpfall_sprite = gm.sprite_duplicate(gm.constants.sWispGIdle)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)

--local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)

gm.sprite_set_offset(loadout_sprite, 15, -85)
gm.sprite_set_offset(death_sprite, 15, 55)

gm.sprite_set_speed(idle_sprite, 1, 1)
gm.sprite_set_speed(attack_sprite0, 1, 1)
gm.sprite_set_speed(walk_sprite, 0.75, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local GreaterWisp_id = -1
local GreaterWisp = nil

GreaterWisp, GreaterWisp_id = setup_survivor(
    "SmoothSpatula", "GreaterWisp", "GreaterWisp", "Big one of Living fire masks?", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite, jumpfall_sprite, nil,
    {["r"]=160, ["g"] = 115, ["b"] = 116}, {[1] = 0.0, [2] = - 20.0, [3] = 3.0}
)

setup_skill(GreaterWisp.skill_family_z[0], "Primary attack", "Flame power", 
    skills_sprite, 1, attack_sprite0, 
    0.0, 1.0, true, 154)

setup_empty_skill(GreaterWisp.skill_family_x[0])
setup_empty_skill(GreaterWisp.skill_family_c[0])
setup_empty_skill(GreaterWisp.skill_family_v[0])

setup_stats(GreaterWisp_id, 0.1, nil, nil, 0.05, nil, nil, 400, nil, nil)

-- == Callback == -- 

-- fix damage multi
gm.pre_script_hook(gm.constants.fire_explosion, function(self, other, result, args) -- scale 
    if self.class == GreaterWisp_id then
        args[4].value = 6.0 -- damage multi
    end
end)
