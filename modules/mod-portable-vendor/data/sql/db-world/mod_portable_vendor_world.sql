-- mod-portable-vendor: world database SQL
-- NPC entry: 601015  |  Item entry: 601015

-- ============================================================
-- Creature template: portable vendor companion NPC
-- ============================================================
-- npcflag    : 128 (VENDOR) + 4096 (REPAIR) = 4224
-- unit_flags : 256 (IMMUNE_TO_PC) + 512 (IMMUNE_TO_NPC) + 131072 (PACIFIED) = 131840
-- unit_flags2: 32 (DO_NOT_FADE_IN)
-- type_flags : 8388608 (INTERACT_ONLY_WITH_CREATOR) + 16777216 (DO_NOT_PLAY_UNIT_EVENT_SOUNDS)
--            + 262144 (ALLOW_INTERACTION_WHILE_IN_COMBAT) + 1048576 (NO_NAME_PLATE) = 26476544
-- flags_extra: 2 (CIVILIAN) + 8192 (CANNOT_ENTER_COMBAT) + 4194304 (AVOID_AOE)
--            + 16777216 (MODULE) + 67108864 (IGNORE_ALL_ASSISTANCE_CALLS)
--            + 536870912 (IGNORE_PATHFINDING) = 624959490
DELETE FROM `creature_template` WHERE `entry` = 601015;
INSERT INTO `creature_template`
    (`entry`, `name`, `subname`, `gossip_menu_id`,
     `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`,
     `speed_walk`, `speed_run`, `rank`, `dmgschool`,
     `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`,
     `BaseVariance`, `RangeVariance`,
     `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`,
     `family`, `type`, `type_flags`,
     `lootid`, `pickpocketloot`, `skinloot`,
     `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`,
     `AIName`, `MovementType`, `HoverHeight`,
     `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`,
     `RacialLeader`, `movementId`, `RegenHealth`,
     `flags_extra`, `ScriptName`, `VerifiedBuild`)
VALUES
    (601015, 'Vendor', '', 0,
     80, 80, 2, 35, 4224,
     1, 1.14286, 0, 0,
     1, 2000, 2000,
     1, 1,
     1, 131840, 32, 0,
     0, 7, 26476544,
     0, 0, 0,
     0, 0, 0, 0,
     '', 0, 1,
     1, 1, 1, 0,
     0, 0, 1,
     624959490, '', 12340);

-- Model: display ID 22778 is Clockwork Rocket Bot.
DELETE FROM `creature_template_model` WHERE `CreatureID` = 601015;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)
VALUES (601015, 0, 22778, 1, 1, 12340);

-- ============================================================
-- Item template: portable vendor toy
-- ============================================================
-- spellid_1 = 23012 (Orcish Orphan Whistle — self-targeted companion summon).
-- NOTE: spell 55884 cannot be used — ObjectMgr resets it to 0 if spellid_2 is not set.
-- spelltrigger_1 = 0   → "Use:"
-- spellcharges_1 = 0   → unlimited uses
-- spellcooldown_1 = -1 → no cooldown (toggle behavior handled by ItemScript)
-- bonding = 1          → Bind on Pickup
DELETE FROM `item_template` WHERE `entry` = 601015;
INSERT INTO `item_template`
    (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`,
     `Quality`, `Flags`, `FlagsExtra`,
     `BuyCount`, `BuyPrice`, `SellPrice`,
     `InventoryType`, `AllowableClass`, `AllowableRace`,
     `ItemLevel`, `RequiredLevel`,
     `maxcount`, `stackable`, `bonding`,
     `spellid_1`, `spelltrigger_1`, `spellcharges_1`,
     `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`,
     `description`, `ScriptName`, `VerifiedBuild`)
VALUES
    (601015, 15, 0, -1, 'Vendor', 47926,
     4, 0, 0,
     1, 0, 0,
     0, -1, -1,
     1, 0,
     1, 1, 1,
     23012, 0, 0,
     0, -1, 0, -1,
     'Summons a vendor.', 'item_portable_vendor', 12340);
