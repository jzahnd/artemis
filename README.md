[![Build Status](https://travis-ci.org/IcaliaLabs/artemis.svg?branch=master)](https://travis-ci.org/IcaliaLabs/artemis)
<a href="https://codeclimate.com/repos/582ddb758ec2e6008000009a/feed"><img src="https://codeclimate.com/repos/582ddb758ec2e6008000009a/badges/5b338f461679b2e41308/gpa.svg" /></a>

![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)


<div style="text-align:center">
  <img src="assets/logo.png" width="980">
</div>

Artemis is a wrapper for the [Watson Conversation Service](http://www.ibm.com/watson/developercloud/doc/conversation/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'artemis-bot'
```

And run `bundle install` from your shell

To install the gem manually from your shell, run:

    $ gem install artemis-bot

## Configuration

First you need to configure Artemis with your Conversation credentials

```ruby
  Artemis::Bot.configure do |config|
    config.username = "your-username-here"
    config.password = "your-password-here"
    config.base_uri = "https://gateway.watsonplatform.net/conversation/api"
  end
```

## Usage

To send a message:

```ruby
workspace_id =  "your-workspace_id-here"

message_request = Artemis::Bot::MessageRequest.new
message_request.input.text = "Hello there"
message_request.alternate_intents = true

response = Artemis::Bot::Conversator.message(workspace_id, message_request)
```

To follow up a conversation:

```ruby
# assign the context from the previous response
message_request.context = response.context
message_request.input.text = "How you doing?"

# send the message through the Conversator
response = Artemis::Bot::Conversator.message(workspace_id, message_request)
```

`Artemis::Bot::MessageRequest` is a wrapper of the [MessageRequest hash](http://www.ibm.com/watson/developercloud/conversation/api/v1/?curl#send_message) that the endpoint is expecting


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/icalialabs/artemis. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
