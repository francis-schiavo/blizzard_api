# Blizzard Api

[![pipeline status](https://gitlab.com/francisschiavo/blizzard_api/badges/master/pipeline.svg)](https://gitlab.com/francisschiavo/blizzard_api/commits/master)
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
   - 4.3. [Starcraft II endpoints](#43-starcraft-ii-endpoints)

## 1. Installation

Add this line to your application's Gemfile: 

```ruby
gem 'blizzard_api'
```

And then execute:

    $ bundle

## 2. Configuration

Before you use the api you must create a developer account at https://develop.battle.net and create the client authorization keys.

Once you have a pair of client ID and SECRET you must set up an initialization code.

```ruby
BlizzardApi.configure do |config|
  config.app_id = ENV['BNET_APPLICATION_ID']
  config.app_secret = ENV['BNET_APPLICATION_SECRET']
  config.region = 'us'
  config.use_cache = true
  config.redis_host = ENV['REDIS_HOST']
  config.redis_port = ENV['REDIS_PORT']
end
```

It is highly recommended to use [redis](https://redis.io/) to cache all requests as it avoids unnecessary calls and speeds up your application.

## 3. Basic usage

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

:bulb: If you use the wrapper it will always use the default region specified in the configuration file.

Most **data** endpoints will have always 3 methods available `index`, `get` and `complete`.

* `index` is used to get a list of all resources od that endpoint.
* `get` is used to get all information about a entry of the index returned data. It receives an id or slug as the first parameter, that depends on the endpoint.
* `complete` is a complete information of all items listed in index. **This may perform various calls to the blizzard api** only use if you really need all information.

## 4. Available endpoints

**Hint**: All methods support an additional optional hash parameter that allows you to override the following configurations for a single call:

* **ttl**: < int > - Cache duration (seconds) (Only works if you have redis enabled)
* **ignore_cache**: true - Ignores the cache and forces an api request (Only works if you have redis enabled)
* **locale**: < locale id > - Changes the default locale (if any)

### 4.1. World of Warcraft endpoints

* Blizzard::Wow::Achievement
  - get :id
  - index
  - categories
  - category :id
  - character_achievement_index
  - guild_achievement_index
  - media :id
* Blizzard::Wow::ConnectedRealm
  - index
  - get :id
  - complete
* Blizzard::Wow::Creature
  - get :id
  - families
  - family :id
  - family_media :id
  - types
  - type :id
  - display_media :id
* Blizzard::Wow::Guild
  - rewards
  - perks
  - get :realm, :guild
  - roster :realm, :guild
  - achievements :realm, :guild
* Blizzard::Wow::GuildCrest
  - index
  - border_media :id
  - emblem_media :id
* Blizzard::Wow::MythicKeystonesAffix
  - index
  - get :id
  - complete
* Blizzard::Wow::MythicKeystone
  - index
  - dungeons
  - dungeon :id
  - periods
  - period :id
  - seasons
  - season :id
* Blizzard::Wow::MythicRaidLeaderboard
  - get :raid_slug, :faction_slug
* Blizzard::Wow::Mount
  - index
  - get :id
  - complete
* Blizzard::Wow::MythicKeystoneLeaderboard
  - index :connected_realm_id
  - get :connected_realm_id, :dungeon_id, :period
* Blizzard::Wow::Pet
  - index
  - get
  - ability :id
  - species :id
  - stats :level, :breed_id, :quality_id
  - types
* Blizzard::Wow::PlayableClass
  - index
  - get :id
  - complete
  - talent_slots :id
* Blizzard::Wow::PlayableSpecialization
  - index
  - get :id
  - complete
* Blizzard::Wow::PowerType
  - index
  - get :id
  - complete
* Blizzard::Wow::PvpSeason
  - index
  - get :id
  - leaderboards :season_id
  - leaderboard :season_id, :brackets
  - rewards :season_id
* Blizzard::Wow::PvpTier
  - index
  - get :id
  - tier_media :id
* Blizzard::Wow::Realm
  - index
  - get :id
  - complete
* Blizzard::Wow::Region
  - index
  - get :id
  - complete
* Blizzard::Wow::WowToken
  - get
* Blizzard::Wow::Race
  - index
  - get :id
  - complete


* Blizzard::Wow::Auction
  - get :realm
* Blizzard::Wow::Boss
  - index
  - get :id
* Blizzard::Wow::Challenge
  - realm_index
  - region_index
* Blizzard::Wow::Character
  - get :realm, :character, :fields
  - get_keystone_profile :realm, :character, :user_token, :season
  - get_user_characters :user_token
* Blizzard::Wow::Guild
  - get :relam, :name, :fields
  - rewards
  - perks
* Blizzard::Wow::Item
  - get :id
  - item_set :setId
* Blizzard::Wow::PvP
  - get :bracket
* Blizzard::Wow::Quest
  - get :id
* Blizzard::Wow::Recipe
  - get :id
* Blizzard::Wow::Spell
  - get :id
* Blizzard::Wow::Zone
  - index
  - get :id


* BlizzardApi::Wow::CharacterProfile
  - get_keystone_profile :realm, :character, :user_token, :season
  - pvp_summmary :realm, :character, :user_token
  - pvp_bracket :realm, :character, :bracket, :user_token

### 4.2. Diablo III endpoints

* BlizzardApi::Diablo::Act
  - index
  - get :id
* BlizzardApi::Diablo::Artisan
  - get :artisan_slug
  - recipe :artisan_slug, :recipe_slug
* BlizzardApi::Diablo::Follower
  - get :slug
* BlizzardApi::Diablo::Character
  - get :class_slug
  - skill :class_slug, :skill_slug
* BlizzardApi::Diablo::ItemType
  - index
  - get :item_type_slug
* BlizzardApi::Diablo::Item
  - get :item_slug, :item_id
* BlizzardApi::Diablo::Profile
  - index :battletag, :oauth_token
  - hero :battletag, :oauth_token, :hero_id
  - hero_items :battletag, :oauth_token, :hero_id
  - hero_follower_items :battletag, :oauth_token, :hero_id
  
### 4.3. Starcraft II endpoints

Every endpoint requiring a *region_id* parameter will accepts either the integer representation of the region described in the api docs or a symbol: `:US`, `:EU`, `:KO` or `:TW` 

* BlizzardApi::Starcraft::League
  - get :season_id, :queue_id, :team_type, :league_id
* BlizzardApi::Starcraft::Profile
  - static :region_id
  - metadata :region_id, :realm_id, :profile_id
  - profile :region_id, :realm_id, :profile_id
  - ladder_summary :region_id, :realm_id, :profile_id
  - ladder :region_id, :realm_id, :profile_id, :ladder_id
* BlizzardApi::Starcraft::Ladder
  - grandmaster :region_id, :options
  - season :region_id
* BlizzardApi::Starcraft::Account
  - player :account_id

## Contributing

Bug reports and pull requests are welcome on Gitlab at https://gitlab.com/francisschiavo/blizzard_api/issues

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
