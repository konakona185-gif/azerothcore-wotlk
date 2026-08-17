/*
 * Module: mod-portable-vendor
 *
 * Adds a toy item that summons a temporary vendor companion.
 * The player can sell items from their inventory to the summoned NPC.
 *
 * NPC entry:  601015
 * Item entry: 601015
 */

#include "Chat.h"
#include "Creature.h"
#include "ItemScript.h"
#include "Player.h"
#include "ScriptMgr.h"

namespace ModPortableVendor
{
    constexpr uint32 NPC_ENTRY     = 601015;
    // Spell 23012 is the Orcish Orphan Whistle spell (companion summon, self-targeted).
    // It is used only as the item trigger — the actual spell cast is blocked by this script.
    // NOTE: spell 55884 cannot be used — ObjectMgr resets it to 0 if spellid_2 is not set.
    constexpr uint32 SPELL_TRIGGER = 23012;
    constexpr float FOLLOW_DIST  = 2.5f;
    constexpr float FOLLOW_ANGLE = float(M_PI); // behind the player
}

class item_portable_vendor : public ItemScript
{
public:
    item_portable_vendor() : ItemScript("item_portable_vendor") { }

    bool OnUse(Player* player, Item* item, SpellCastTargets const& /*targets*/) override
    {
        using namespace ModPortableVendor;

        if (player->IsInCombat())
        {
            ChatHandler(player->GetSession()).SendSysMessage("Vous ne pouvez pas invoquer votre compagnon en combat !");
            player->SendEquipError(EQUIP_ERR_NONE, item, nullptr);
            return true;
        }

        // Toggle: dismiss if already present
        if (Creature* existing = player->FindNearestCreature(NPC_ENTRY, 50.0f, true))
        {
            existing->DespawnOrUnsummon();
            return true;
        }

        // Spawn 2.5m behind the player so it appears right where it will follow from.
        float angle = player->GetOrientation();
        float behindAngle = angle + FOLLOW_ANGLE;
        TempSummon* vendor = player->SummonCreature(
            NPC_ENTRY,
            player->GetPositionX() + FOLLOW_DIST * std::cos(behindAngle),
            player->GetPositionY() + FOLLOW_DIST * std::sin(behindAngle),
            player->GetPositionZ(),
            angle,
            TEMPSUMMON_MANUAL_DESPAWN,
            0
        );

        if (!vendor)
            return true;

        vendor->GetMotionMaster()->MoveFollow(player, FOLLOW_DIST, FOLLOW_ANGLE);

        return true;
    }
};

void AddSC_mod_portable_vendor()
{
    new item_portable_vendor();
}
