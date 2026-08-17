# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

# mod-portable-vendor

[English](#english) | [Français](#français)

[![Build Status](https://github.com/azerothcore/mod-portable-vendor/workflows/core-build/badge.svg?branch=master&event=push)](https://github.com/azerothcore/mod-portable-vendor/actions)

---

## English

### Description

This module adds a toy item — **Portable Merchant Companion** — that summons a temporary vendor NPC
(Field Repair Bot 74A) who follows the player and allows selling items from the inventory.
The companion stays for **3 minutes** and the item has a **3-minute cooldown**.

### Features

- Summons a vendor NPC companion that follows the player at a short distance
- The player can sell any inventory item by right-clicking it while the window is open
- Blocked in combat
- Prevents double-summon if the companion is already present within 50 yards
- 3-minute companion duration and 3-minute item cooldown
- Bind on Pickup — one per character, unlimited uses

### Requirements

- AzerothCore (latest master branch recommended)

### Installation

#### 1. Clone the module

```bash
cd path/to/azerothcore/modules
git clone https://github.com/azerothcore/mod-portable-vendor.git
```

#### 2. Apply the SQL

```bash
mysql -u root -p acore_world < modules/mod-portable-vendor/data/sql/db-world/mod_portable_vendor_world.sql
```

Or restart the worldserver with DB updates enabled — the file will be applied automatically.

#### 3. Recompile

```bash
cd path/to/azerothcore/build
cmake ..
make -j$(nproc)
make install
```

#### 4. Get the item in-game (GM command)

```
.additem 601015
```

### IDs used

| Type | Entry |
|------|-------|
| Item | 601015 |
| NPC  | 601015 |

> If these IDs conflict with another module, edit `NPC_ENTRY` in `mod_portable_vendor.cpp`
> and the SQL accordingly.

### License

Released under the [GNU AGPL v3](../LICENSE).

---

## Français

### Description

Ce module ajoute un objet jouet — **Compagnon Marchand Portable** — qui invoque un PNJ vendeur
temporaire (Field Repair Bot 74A) qui suit le joueur et lui permet de vendre des objets depuis son
inventaire. Le compagnon reste **3 minutes** et l'objet a un **cooldown de 3 minutes**.

### Fonctionnalités

- Invoque un compagnon PNJ vendeur qui suit le joueur à courte distance
- Le joueur peut vendre tout objet de son inventaire en cliquant droit dessus pendant que la
  fenêtre est ouverte
- Bloqué en combat
- Empêche le double-invocage si le compagnon est déjà présent dans un rayon de 50 mètres
- Durée du compagnon : 3 minutes, cooldown de l'objet : 3 minutes
- Lié à la prise — un par personnage, utilisations illimitées

### Prérequis

- AzerothCore (dernière branche master recommandée)

### Installation

#### 1. Cloner le module

```bash
cd chemin/vers/azerothcore/modules
git clone https://github.com/azerothcore/mod-portable-vendor.git
```

#### 2. Appliquer le SQL

```bash
mysql -u root -p acore_world < modules/mod-portable-vendor/data/sql/db-world/mod_portable_vendor_world.sql
```

Ou redémarrer le worldserver avec les mises à jour DB activées — le fichier sera appliqué
automatiquement.

#### 3. Recompiler

```bash
cd chemin/vers/azerothcore/build
cmake ..
make -j$(nproc)
make install
```

#### 4. Obtenir l'objet en jeu (commande GM)

```
.additem 601015
```

### IDs utilisés

| Type  | Entrée |
|-------|--------|
| Objet | 601015 |
| PNJ   | 601015 |

> Si ces IDs entrent en conflit avec un autre module, modifiez `NPC_ENTRY` dans
> `mod_portable_vendor.cpp` et le SQL en conséquence.

### Licence

Publié sous [GNU AGPL v3](../LICENSE).

---

## Links / Liens

- **AzerothCore :** [Dépôt](https://github.com/azerothcore) | [Site](https://azerothcore.org/) | [Discord](https://discord.gg/PaqQRkd)
- **Issues :** [Issue Tracker](https://github.com/azerothcore/mod-portable-vendor/issues)
