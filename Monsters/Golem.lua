-- Golem v1.0.0
-- SmoothSpatula
log.info("Successfully loaded ".._ENV["!guid"]..".")

-- ========== Sprite ========== 

local portrait_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorPortrait.png")
local portraitsmall_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorPortraitSmall.png")
local skills_path = path.combine(_ENV["!plugins_mod_folder_path"], "Sprites", "MacrobicPredatorSkill.png")

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
gm.sprite_set_speed(walk_sprite, 1, 1)
--gm.sprite_set_speed(special_sprite, 1, 1)
--gm.sprite_set_speed(utility_sprite, 1, 1)
--gm.sprite_set_speed(secondary_sprite, 1, 1)
gm.sprite_set_speed(loadout_sprite, 5, 0)
gm.sprite_set_speed(death_sprite, 1, 1)

-- ========== Survivor Setup ==========

local Golem_id = -1
local Golem = nil

Golem, Golem_id = setup_survivor(
    "SmoothSpatula", "Golem", "Golem", "Constructed from the soil.", "...",
    loadout_sprite, portrait_sprite, portraitsmall_sprite, loadout_sprite,
    walk_sprite, idle_sprite, death_sprite, jump_sprite, jumpfall_sprite, jumpfall_sprite, nil,
    {["r"]=70, ["g"] = 69, ["b"] = 80}, {[1] = 0.0, [2] = - 20.0, [3] = 3.0}
)

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
