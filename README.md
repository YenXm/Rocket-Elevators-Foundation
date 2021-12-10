# Week10

## Streamer

The Streamer Class provide multiple method, the most important behind the getContent one. The getContent require the caller to pass an hash with a minimum this key/value set: {content_type: "string"}, the string value represent which content we want to be sent back from the method.

Currently available content:

1. {content_type: "youtube", video_name: :rickroll}, Right now there is only :rickroll available as video name.
2. {content_type: "covid"}
3. {content_type: "soccer"}
4. {content_type: "weather"}

All these content return html representing an embedded media element.

The file can be found [here](lib/elevator_media/streamer.rb)

## Unit Test

RSpec 3.10
  - rspec-core 3.10.1
  - rspec-expectations 3.10.1
  - rspec-mocks 3.10.2
  - rspec-rails 5.0.2
  - rspec-support 3.10.3

Command to test streamer class *bundle exec rspec ./spec/elevator_media/streamer_spec.rb*

The file can be found [here](spec/elevator_media/streamer_spec.rb)

## Security Assessment

[Google Doc](https://docs.google.com/document/d/1DE_oE_EkPFk0K-YvXKI9s3noxbbfDreFsvPniUbDU-U/edit?usp=sharing)
