## World of Warcraft 

This documentation shows the usage of the gem with the World of Warcraft
endpoints defined by Blizzard.
All examples assume that the client is properly configured,
and that a valid OAuth2 access token has been obtained with the user's conscent using the
required OAuth2 permission workflow.

## Achievements

This endpoint lists all achievements available in the game to the player in question.

```ruby
access_token = '' # Obtained from the OAuth2 callback (not the client call)
achievements = client.world_of_warcraft.achievements(access_token:)
#=> [#<BattleNetClient::Models::Achievements id=1 name="World of Warcraft Test Achievement">]
```
