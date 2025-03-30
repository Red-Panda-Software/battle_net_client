# Battle.Net Client Usage

This document explains the usage with some examples of the gem.
Please note that the gem relies on your `client_id` and `client_secret` to properly authenticate.
The tests and examples assume your `ENV` is properly configured and set up.

## Configuration

The following settings must be applied globally for the client to function:

```ruby
require 'battle_net_client'

client = ::BattleNetClient::Client.new
client.config.client_id = ENV['CLIENT_ID']
client.config.client_secret = ENV['CLIENT_SECRET']
```

Because the client relies on `ActiveSupport::Configurable`,
it's also possible to configure the client globally,
for example with a Rails initializer:

```ruby
# config/initializers/battle_net_client.rb
require 'battle_net_client'

BattleNetClient::Client.client_id = ENV['CLIENT_ID']
BattleNetClient::Client.client_secret = ENV['CLIENT_SECRET']
```

## Access Token

The access token is the OAuth2 access token used to authorize every API call.
The client will automatically request a token on each request, but you can also 
request this token manually when the client is configured properly.

```ruby
require 'battle_net_client'

client = ::BattleNetClient::Client.new
client.config.client_id = ENV['CLIENT_ID']
client.config.client_secret = ENV['CLIENT_SECRET']

client.access_token
"USo3ttJG5Bxqb50YfhLVZ8JvF4UIOO9TXL" # These are time-bound.
```
