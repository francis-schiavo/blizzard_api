Please view this file on the master branch, otherwise it may be outdated

**Version 0.4.0**

Added support to searchable endpoints

https://develop.battle.net/documentation/world-of-warcraft/guides/search

**Version 0.3.11**

Fixed D3 item URL.

**Version 0.3.10**

Really fixed D3 profile URLs this time.

**Version 0.3.9**

Fix D3 profile URLs.

**Version 0.3.8**

Added new profession endpoints.

https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-patch-notes-20200414/5680

**Version 0.3.7**

Automated test improvements
Added region parameters to all game module methods. This will allow multi-region applications to have more flexibility when creating instances.

**Version 0.3.6**

Fix Diablo shortcuts.
Adding SC2 endpoints back.
 
https://us.forums.blizzard.com/en/blizzard/t/starcraft-ii-community-api-update/2652/5

**Version 0.3.5**

Fixed a bug for generating slugs for Korean

Removed deprecated WoW community endpoints.

**Version 0.3.4**

Fixed account endpoints

**Version 0.3.3**

Added character profile encounter endpoints:
https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-patch-notes-20200226/3713

Added missing media endpoints for `playable_class`, `playable_specialization` and `mythic_keystone_affix`

**Version 0.3.2**

Added new WoW endpoints: https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-update-visions-of-nzoth/3461

**Attention:** Removed compatibility with community endpoints for all migrated endpoints.

**Version 0.3.1**

https://us.forums.blizzard.com/en/blizzard/t/hearthstone-api-updates/2978

Hearthstone updates:

* Added the new Cardback endpoint
* Card endpoint now supports the new `gameMode` search option

**Version 0.3.0**

https://us.forums.blizzard.com/en/blizzard/t/starcraft-ii-community-api-update/2652

Removed all Starcraft II related code.

**Version 0.2.9**

https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-update-collections-hunter-pets-and-reputations/757
* Added new character endpoints: 
  * reputations
  * hunter-pets
  * collections
  * pets
  * mounts

* Added new endpoints:
  * reputation-tiers
  * reputation-faction

* Marked all WoW community endpoints as deprecated: https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-community-api-migration/767

**Version 0.2.8**
* Added the new character status endpoint

**Version 0.2.7**
* Changed CI process to use docker ruby images.

**Version 0.2.6**
* Added namespace `static-classic` for wow classic support.
* Some WoW endpoints now support the `classic: true` option.

**Version 0.2.5**
* Added two unreleased endpoints for character profile(`raid_progression` and `collections`).
* Added new WoW profile endpoints
* Added missing profile automated tests

**Version 0.2.4**
* Added new WoW profile endpoints: #2 https://us.battle.net/forums/en/bnet/topic/20772457051
* Added support for HearthStone: !1 (Thanks Bradyn Glines for implementing this)

**Version 0.2.3**
* Added new api endpoints listed here: https://us.battle.net/forums/en/bnet/topic/20772337044

**Version 0.2.2**
* Added new api endpoints listed here: https://us.battle.net/forums/en/bnet/topic/20771546990

**Version 0.2.1**
* Added icon to playable_class return value
* Temporarily ignoring some rubocop offenses as the recommended alternatives are not suitable

**Version 0.2.0**
* D3/SC2 endpoints
* Lots of improvements to WoW endpoints

**Version 0.1.0**
* Initial release