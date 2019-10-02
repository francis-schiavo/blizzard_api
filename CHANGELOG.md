Please view this file on the master branch, otherwise it may be outdated

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