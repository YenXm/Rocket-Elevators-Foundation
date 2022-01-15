require File.expand_path(File.dirname(__FILE__) + '/../../config/environment.rb')

namespace :cc do
  task :populate do
    # THIS TASK IS TO BE RUN ONCE
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI('https://investing-cryptocurrency-markets.p.rapidapi.com/currencies/list?lang_ID=1&time_utc_offset=28800')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-host'] = ENV['X-RAPIDAPI-HOST']
    request['x-rapidapi-key'] = ENV['X-RAPIDAPI-KEY']

    response = http.request(request)

    # puts response.read_body
    json = JSON.parse(response.body)

    # Use to determine the length of the progressbar
    total = json['data'][0][0]['data'].length + json['data'][0][1]['data'].length + json['data'][0][2]['data'].length

    bar = ProgressBar.create(total: total)

    # Populate the database with the data returned fom the api call
    3.times do |i|
      first_stage = json['data'][0][i]['data']

      first_stage.length.times do |j|
        second_stage = first_stage[j]
        Currency.create!(
          currency_ID: second_stage['currency_ID'],
          currency_short_name: second_stage['currency_short_name'],
          fullname: second_stage['fullname'],
          currency_symbol: second_stage['currency_symbol'],
          major: second_stage['major'],
          is_crypto: second_stage['is_crypto'],
          countryID: second_stage['countryId']
        )
        bar.increment
      end
    end
  end
end
