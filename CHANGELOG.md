Please view this file on the master branch, otherwise it may be outdated

**Version 4.1.0**

Removed the discontinued Overwatch League API

Updated all dependencies to latest version

Note: While this introduces a breaking change, I did not bump version to 5.x.x
since the Overwatch League API was already broken.

**Version 4.0.0**

**Warning**: This version introduces breaking changes to the way the gem handles the Redis connection.
  Instead of providing the HOST, PORT and DB as separate options, now you should provide the full URL in the `redis_url` option.

This allows for more flexibility when using Redis, as it is now possible to use a password protected database.

Added a binary for experimenting with the gem or using it as a command line tool.

**Version 3.4.0**

Added new collections endpoints for toys and heirlooms.

**Version 3.2.0**

Added new WoW Dragonflight talents endpoint.
Added support for Overwatch League API

**Version 3.2.0**

Added new AH commodities endpoint.

**Version 3.1.0**

Fixed the latest build to exclude non 200 responses from caching.

**Version 3.0.0**

Changed the way `:extended` mode is handled regarding caching. Now the extended mode will use cache and return a fake
  response object if the content is cached (Cache is still ignored when using the `:since` option).
A cached response can be identified by the presence of a `cached?` method on the response object.

Some automated tests for SC2 endpoints are now ignoring `503` errors. The state of the API is somehow unknown since it
  is down most of the time.

**Version 2.0.0**

Removed the `icon` field from PlayableClass, it was meant to mimic the old communit API behavior during the transition
  to the new game_data version.

**Version 1.0.0**

Removed the `complete` method from WoW game data endpoints.
Removed the `concurrency` request and configuration option as it is not necessary anymore.
Removed the `thwait` dependency.

Added the `redis_database` option to support selecting the redis database for caching data.
The gem will now share a single Redis connection across all calls.
The gem now creates a new token on demand if the previous one has expired.
It is now possible to cache the token in Redis to avoid needlessly creating a new token.
It is now possible to set the default mode for API calls

**Version 0.6.4**

Fixed argument propagation in SC2 legacy profile methods.

**Version 0.6.3**

Fixed argument propagation in some profile methods.

**Version 0.6.2**

Fixed an encoding problem on search endpoints.

**Version 0.6.1**

Added support for TBCC and Classice Era endpoints.

**Version 0.6.0**

Upgraded gem dependencies and refactored the code to support Ruby 3.0.0
Required ruby version upgraded to 2.7.2
Added concurrency to all WoW game data *complete* methods. Default of 4 threads. Should be close to # of threads available.

**Version 0.5.6**

Upgrade gem dependencies to fix a security vulnerability 

**Version 0.5.5**

Removing old and deprecated function from community endpoint.

Refactored all `options` arguments to use double splat syntax.

Modified README.md to point to the actual documentation and include missing endpoints.

**Version 0.5.4**

Added missing legacy SC2 endpoints

See https://github.com/francis-schiavo/blizzard_api/pull/2

**Version 0.5.2**

Added new endpoints: https://us.forums.blizzard.com/en/blizzard/t/wow-shadowlands-api-update-covenenats-soulbinds-more/13385

**Version 0.5.1**

Added new endpoints: https://us.forums.blizzard.com/en/blizzard/t/wow-game-data-api-modified-crafting-support/12727

**Version 0.5.0**

This version brings a lot of internal changes to the way the gem works. While
there no breaking change is expected use it carefully.

## New features:

### Extended mode

When creating a request you can now specify **mode** as the last argument. Available modes:
* **regular**: No changes, should work as it always did.
* **extended**: All requests now return an array with two objects, the actual HTTPResponse object and the usual Hash.

```ruby
api_client = BlizzardApi::Wow::Item.new 'us', :extended
response, item_data = api_client.get 35_000

puts response.code # 200
puts item_data[:name][:en_US] # Brutal Gladiator's Dragonhide Legguards
```

This is intended to expose the response code and headers.

**Important**: Extended mode completely disables the cache.

### Custom headers

You an now pass custom headers in the **options** hash.

There is also a new shorthand for the `If-Modified-Since` header.

```ruby
# If-Modified-Since shorhand
auction_data = BlizzardApi::Wow.auction.get 1146, since: DateTime.parse('2099-01-01Z')

# Using custom headers
auction_data = BlizzardApi::Wow.auction.get 1146, headers: { 'If-Modified-Since' => 'Sun, 27 Sep 2020 02:17:03 GMT' }
```

**Important**
* Headers are not part of the cache key, use the option `ignore_cache: true` when needed.
* The `since` shorthand will always disable the cache.

**Version 0.4.2**

Added new retail and classic search endpoints described here: https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-patch-notes-20200708/10310

**Version 0.4.1**

Added new retail and classic endpoints described here: https://us.forums.blizzard.com/en/blizzard/t/world-of-warcraft-api-patch-notes-20200609/8902

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
