# Artemis

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

```
  Artemis::Bot.configure do |config|
    config.username = "your-username-here"
    config.password = "your-password-here"
  end
```

## Usage

To send a message:

```
workspace_id =  "your-workspace_id-here"

message_request = Artemis::Bot::MessageRequest.new
message_request.input.text = "Hello there"
message_request.alternate_intents = true

response = Artemis::Bot::Conversator.message(workspace_id, message_request)
```

To follow up a conversation:

```
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
