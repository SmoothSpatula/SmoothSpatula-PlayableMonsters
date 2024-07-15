-- Golem v1.0.1
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GolemPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GolemPortraitSmall.png")
local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "GolemSkill.png")

local portrait_sprite = gm.sprite_add(portrait_path, 1, false, false, 0, 0)
local portraitsmall_sprite = gm.sprite_add(portraitsmall_path, 1, false, false, 0, 0)
local skills_sprite = gm.sprite_add(skills_path, 1, false, false, 0, 0)
local loadout_sprite = gm.sprite_duplicate(gm.constants.sGolemSpawn)
local idle_sprite = gm.sprite_duplicate(gm.constants.sGolemIdle)
local walk_sprite = gm.sprite_duplicate(gm.constants.sGolemWalk)
local attack_sprite = gm.sprite_duplicate(gm.constants.sGolemShoot1)
-- local shoot1_air_sprite = gm.sprite_add(shoot1_air_path, 7, false, false, 29, 45)
-- local special_sprite = gm.sprite_duplicate(822)
-- local utility_sprite = gm.sprite_duplicate(823)
-- local secondary_sprite = gm.sprite_duplicate(826)
--local climb_sprite = gm.sprite_duplicate(gm.constants.sLizardClimb)
local death_sprite = gm.sprite_duplicate(gm.constants.sGolemDeath)
local jump_sprite = gm.sprite_duplicate(gm.constants.sGolemJump)
local jumpfall_sprite = gm.sprite_duplicate(gm.constants.sGolemFall)
-- local hit_sprite = gm.sprite_add(hit_path, 1, false, false, 29, 45)

--local palette_sprite = gm.sprite_add(hit_path, 1, false, false, 0, 0)


-- Sprite Offsets
gm.sprite_set_offset(loadout_sprite, 40, -65)

gm.sprite_set_offset(idle_sprite, 25, 50)
gm.sprite_set_offset(walk_sprite, 25, 45)

gm.sprite_set_offset(jump_sprite, 27, 40)
gm.sprite_set_offset(jumpfall_sprite, 27, 40)

gm.sprite_set_offset(death_sprite, -10, 65)

gm.sprite_set_offset(attack_sprite, 61, 70)
-- Sprite Speeds
gm.sprite_set_speed(idle_sprite, 1, 1)
gm.sprite_set_speed(attack_sprite, 1, 1)
gm.sprite_set_speed(walk_sprite, 0.75, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local Golem_id = -1
local Golem = nil


-- function setup_survivor(namespace, identifier, name, description, end_quote,
-- loadout_sprite, portrait_sprite, portraitsmall_sprite, palette_sprite, 
-- walk_sprite, idle_sprite, death_sprite, jump_sprite, jump_peak_sprite, jumpfall_sprite, climb_sprite,
-- colour, cape_array)
Golem, Golem_id = setup_survivor(
    "SmoothSpatula", "Golem", "Golem", "Constructed from the soil.", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite, jumpfall_sprite, nil,
    {["r"]=70, ["g"] = 69, ["b"] = 80}, {[1] = 0.0, [2] = - 20.0, [3] = 3.0}
)
-- function setup_stats(survivor_id, armor, attack_speed, movement_speed, critical_chance, damage, hp_regen, maxhp, maxbarrier, maxshield)
setup_stats(Golem_id, nil, 1.0, nil, 1.0, nil, 0.04, 300,  nil, nil)

-- function setup_level_stats(survivor_id, armor_level, attack_speed_level, critical_chance_level, damage_level, hp_regen_level, maxhp_level)
setup_level_stats(Golem_id, nil, nil, nil, nil, nil, 50)

-- function setup_skill(skill_ref, name, description, 
-- sprite, sprite_subimage,animation, 
-- cooldown, damage, is_primary, skill_id)
setup_skill(Golem.skill_family_z[0], "Primary attack", "Big Slam", 
    skills_sprite, 1, attack_sprite, 
    0.0, 10.0, true, 160)

setup_empty_skill(Golem.skill_family_x[0])
setup_empty_skill(Golem.skill_family_c[0])
setup_empty_skill(Golem.skill_family_v[0])

gm.pre_script_hook(gm.constants.fire_explosion, function(self, other, result, args) -- scale 
    if self.class == Golem_id then
        args[4].value = 4.0 -- damage multi
    end
end)
