# Blizzard Api

[![Gem Version](https://badge.fury.io/rb/blizzard_api.svg)](https://badge.fury.io/rb/blizzard_api)

This gem allow you to interface with the new blizzard api (2018) using the OAuth2 protocol for every request.

**Important**: This gem does not support, nor will support China endpoints. 

## Table of contents
1. [Installation](#1-installation)
2. [Configuration](#2-configuration)
3. [Basic usage](#3-basic-usage)
4. [Available endpoints](#4-available-endpoints)
   - 4.1. [World of Warcraft endpoints](#41-world-of-warcraft-endpoints)
   - 4.2. [Diablo III endpoints](#42-diablo-iii-endpoints)
   - 4.3. [Hearthstone endpoints](#43-hearthstone-endpoints)
   - 4.4. [Starcraft II endpoints](#43-starcraft-ii-endpoints)

## 1. Installation

Add this line to your application's Gemfile: 

```ruby
gem 'blizzard_api'
```

And then execute:
```bash
$ bundle
```

You can also install the gem and use as a standalone binary:

```bash
gem install blizzard_api
```

## 2. Configuration

Before you use the api you must create a developer account at https://develop.battle.net and create the client authorization keys.

Once you have a pair of client ID and SECRET you must set up an initialization code.

```ruby
BlizzardApi.configure do |config|
  config.app_id = ENV['BNET_APPLICATION_ID']
  config.app_secret = ENV['BNET_APPLICATION_SECRET']
  config.region = 'us'
  config.redis_url = 'redis://localhost:6379/0'
  config.cache_access_token = true
end
```

It is highly recommended to use [redis](https://redis.io/) to cache all requests as it avoids unnecessary calls and speeds up your application.

## 3. Using the shipped binary

This gem ships with a binary that allows you to perform requests to the api directly from the command line. Suppoerted arguments:

## 3.1 Configuration

| Argument                 | Description                                                                                                                |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------|
| -a, --auth               | A pair of application ID and secret created on the Blizzard API dev portal. Argument must be provided as APP_ID:APP_SECRET |
| -c, --cache              | A valid Redis connection string. redis://user:password@host:port/db                                                        |
| -h, --help               | Prints this help                                                                                                           |
| -j, --json               | Outputs the payload as JSON.                                                                                               |
| -J, --formatted-json     | Outputs the payload as pretty formatted JSON.                                                                              |
| -l, --locale             | Locale to use when retrieving data.                                                                                        |
| -o, --output             | Path to an output file.                                                                                                    |
| -r, --region             | Region to use for the API calls. Default is **us**                                                                         |
| -t, --cache-access-token | Cache the access token in Redis                                                                                            |
| -v, --version            | Prints the version                                                                                                         |

Some arguments can be loaded from environment variables:

| Environment Variable    | Description                     | Replaced argument |
|-------------------------|---------------------------------|-------------------|
| BNET_APPLICATION_ID     | Blizzard API application ID     | -a                |
| BNET_APPLICATION_SECRET | Blizzard API application secret | -a                |
| REGION                  | Blizzard API region             | -r                |
| BNET_REDIS_URL          | Redis connection string         | -c                |
| BNET_CACHE_ACCESS_TOKEN | Cache the access token in Redis | -t                |

**Note**: You can also use Dotenv to load the environment variables from a `.env` file as long as you have Dotenv installed
  and the `.env` file is present in the same directory you are invoking the binary from.

## 3.2. Command line usage

You can fetch API endpoints data by using the following format:

```bash
blizzard_api <game namespace> <api endpoint> <endpoint method> [arguments]
```

## 3.3. Examples

### 3.3.1. Using the binary to get a list of realms

```bash
blizzard_api wow realm index
````

### 3.3.1. Using the binary to get a specific realm

Full payload:
```bash
blizzard_api wow realm get 5909
````

Full payload as formatted JSON:
```bash
blizzard_api -J wow realm get 5909
````

Full payload as formatted JSON to file:
```bash
blizzard_api -Jo realm.json wow realm get 5909
````

en-US only payload as formatted JSON:
```bash
blizzard_api -Jl en_US wow realm get 5909
````

## 4. Basic usage

You can now consume the api by instantiating a specific endpoint:

```ruby
race = BlizzardApi::Wow::Race.new :us
race_data = race.complete
```

or you can just use the game namespace wrapper as follows:

```ruby
race = BlizzardApi::Wow.race
race_data = race.complete
```

Most **game data** endpoints will have always 3 methods available `index`, `get` and `complete`.

* `index` is used to get a list of all resources of that endpoint.
* `get` is used to get all information about a entry of the index returned data. It receives an id or slug as the first parameter, that depends on the endpoint.
* `complete` is a complete information of all items listed in index. **This may perform various calls to the blizzard api** only use if you really need all information.

### 4.1 Searchable endpoints

Some endpoints support search filters. To perform a search you can use the following formats:

To use the **or** operator you may pass an array of values as argument to `where` or `where_not` methods.
```ruby
realm = BlizzardApi::Wow.realm
realm_data = realm.search(1, 100) do |options|
  options.where 'name.en_US', %w[Azralon Nemesis]
end
```
 
To use the **and** operator you may call `where` or `where_not` multiple times methods.
```ruby
realm = BlizzardApi::Wow.realm
realm_data = realm.search(1, 100) do |options|
  options.where 'name.en_US', 'Azralon'
  options.where 'id', 3209
end
```

To use the **range** operator you may pass a hash to `where` or `where_not`.
```ruby
realm = BlizzardApi::Wow.realm
realm_data = realm.search(1, 100) do |options|
  options.where 'id', min: 3209, max: 4000, mode: :exclusive
end
```
*Note*: If you don't pass the `mode` key as `:exclusive` it will be `:inclusive` by default.

To **sort** fields you may call the `order_by` method multiple times:
```ruby
realm = BlizzardApi::Wow.realm
realm_data = realm.search(1, 100) do |options|
  options.where 'id', min: 3209, max: 4000, mode: :exclusive
  options.order_by 'id', :desc
end
```

## 5. Available endpoints

**Hint**: All methods support an additional optional hash parameter that allows you to override the following configurations for a single call:

* **ttl**: < int > - Cache duration (seconds) (Only works if you have redis enabled)
* **ignore_cache**: true - Ignores the cache and forces an api request (Only works if you have redis enabled)
* **locale**: < locale id > - Changes the default locale (if any)

**World of Warcraft** supports two additional options:
* **use_community_endpoint**: Some methods in game data still have an odl community version available.
* **classic**: Set to true to query WoW Classic data, only works for some game data endpoints.  

### 5.1. World of Warcraft endpoints

* [BlizzardApi::Wow.achievement](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Achievement)
* [BlizzardApi::Wow.auction](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Auction)
* [BlizzardApi::Wow.azerite_essence](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/AzeriteEssence)
* [BlizzardApi::Wow.connected_realm](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/ConnectedRealm)
* [BlizzardApi::Wow.covenant](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Covenant)
* [BlizzardApi::Wow.creature](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Creature)
* [BlizzardApi::Wow.guild_crest](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/GuildCrest)
* [BlizzardApi::Wow.heirloom](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Heirloom)
* [BlizzardApi::Wow.item](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Item)
* [BlizzardApi::Wow.journal](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Journal)
* [BlizzardApi::Wow.media](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Media)
* [BlizzardApi::Wow.modified_crafting](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/ModifiedCrafting)
* [BlizzardApi::Wow.mount](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Mount)
* [BlizzardApi::Wow.mythic_keystone_affix](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/MythicKeystoneAffix)
* [BlizzardApi::Wow.mythic_keystone](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/MythicKeystone)
* [BlizzardApi::Wow.mythic_raid_leaderboard](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/MythicRaidLeaderboard)
* [BlizzardApi::Wow.mythic_keystone_leaderboard](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/MythicKeystoneLeaderboard)
* [BlizzardApi::Wow.pet](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Pet)
* [BlizzardApi::Wow.playable_class](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PlayableClass)
* [BlizzardApi::Wow.playable_race](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PlayableRace)
* [BlizzardApi::Wow.playable_specialization](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PlayableSpecialization)
* [BlizzardApi::Wow.power_type](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PowerType)
* [BlizzardApi::Wow.profession](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Profession)
* [BlizzardApi::Wow.pvp_season](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PvpSeason)
* [BlizzardApi::Wow.pvp_tier](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/PvpTier)
* [BlizzardApi::Wow.quest](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Quest)
* [BlizzardApi::Wow.realm](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Realm)
* [BlizzardApi::Wow.region](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Region)
* [BlizzardApi::Wow.reputation](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Reputation)
* [BlizzardApi::Wow.spell](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Spell)
* [BlizzardApi::Wow.talent](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Talent)
* [BlizzardApi::Wow.tech_talent](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/TechTalent)
* [BlizzardApi::Wow.title](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Title)
* [BlizzardApi::Wow.toy](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Toy)
* [BlizzardApi::Wow.wow_token](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/WowToken)

* [BlizzardApi::Wow.profile](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Profile)
* [BlizzardApi::Wow.guild](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/Guild)
* [BlizzardApi::Wow.character_profile](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Wow/CharacterProfile)

### 5.2. Diablo III endpoints

* [BlizzardApi::Diablo.season](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Season)
* [BlizzardApi::Diablo.era](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Era)
* [BlizzardApi::Diablo.act](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Act)
* [BlizzardApi::Diablo.artisan](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Artisan)
* [BlizzardApi::Diablo.follower](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Follower)
* [BlizzardApi::Diablo.character](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Character)
* [BlizzardApi::Diablo.item_type](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/ItemType)
* [BlizzardApi::Diablo.item](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Item)
* [BlizzardApi::Diablo.profile](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Diablo/Profile)

### 5.3. Hearthstone endpoints

* [BlizzardApi::Hearthstone.card](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Hearthstone/Card)
* [BlizzardApi::Hearthstone.back](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Hearthstone/Back)
* [BlizzardApi::Hearthstone.deck](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Hearthstone/Deck)
* [BlizzardApi::Hearthstone.metadata](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Hearthstone/Metadata)
  
### 5.4. Starcraft II endpoints

Every endpoint requiring a *region_id* parameter will accepts either the integer representation of the region described in the api docs or a symbol: `:US`, `:EU`, `:KO` or `:TW` 

* [BlizzardApi::Starcraft.profile](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Starcraft/Profile)
* [BlizzardApi::Starcraft.ladder](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Starcraft/Ladder)
* [BlizzardApi::Starcraft.account](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Starcraft/Account)
* [BlizzardApi::Starcraft.legacy](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Starcraft/Legacy)
* [BlizzardApi::Starcraft.league](https://rubydoc.info/gems/blizzard_api/BlizzardApi/Starcraft/League)

## Contributing

Bug reports and pull requests are welcome on Github at https://github.com/francis-schiavo/blizzard_api/issues

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
