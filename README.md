# Week10

## Streamer

The Streamer page is accessed through the route `/media_player` and provide an embed youtube video player. The getContent method inside the Streamer class take the name of a video (They must be set beforehand in the initialize methode of the Streamer class) and will return a html 'body' with the youtube video player.

The module can be found [here](lib/elevator_media.rb)

## Unit Test

1. Test that the html returned from the getContent method is start and end with the good part of our string that represent the an html.

2. Validate 2 column name from the intervention model

3. Validate the proper association between the model intervention and its parent models

You can call the test using the command `bundle exec rspec spec/tester.rb`.




