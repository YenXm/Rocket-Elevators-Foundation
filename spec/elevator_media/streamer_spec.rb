require 'rails_helper'
require 'shoulda-matchers'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.describe ElevatorMedia do
  streamer = ElevatorMedia::Streamer.new

  describe 'get wether content from service' do
    it 'get_weather_from service should be available' do
      expect(streamer).to respond_to(:get_weather_from_service)
    end
    it 'should use RestClient to call service url' do
      expect(RestClient).to receive(:get).with('http://weather_service.com')
      streamer.get_weather_from_service
    end
    it 'should parse response from the service and extract data' do
      service_response = double('service_response')
      expect(RestClient).to receive(:get).with('http://weather_service.com') { service_response }
      expect(JSON).to receive(:parse).with(service_response) { { data: 'blah' } }
      streamer.get_weather_from_service
    end
  end

  describe 'youtube url behavior' do
    it 'should be available' do
      expect(streamer).to respond_to(:build_youtube_url)
    end
    it 'should build youtube url properly' do
      url = streamer.build_youtube_url(:rickroll)
      expect(url).to eq('http://www.youtube.com/embed/dQw4w9WgXcQ?enablejsapi=1&origin=http://example.com')
    end
  end
  describe 'get youtube video from link' do
    it 'get_youtube_video should be available' do
      expect(streamer).to respond_to(:get_youtube_video)
    end
    it 'should use RestClient to call youtube video url' do
      expect(RestClient).to receive(:get).with('https://www.youtube.com/watch?v=dQw4w9WgXcQ')
      streamer.get_youtube_video
    end
  end

  describe 'get weather widget' do
    it 'get_weather_widget should be available' do
      expect(streamer).to respond_to(:get_weather_widget)
    end
    it 'should return a string containing valid html' do
      expect(streamer.get_weather_widget).to match('<div class="booked-wzs-day-val">')
    end
  end

  describe 'get covid map' do
    it 'get_covid_map should be available' do
      expect(streamer).to respond_to(:get_covid_map)
    end
    it 'should return a string containing valid html' do
      expect(streamer.get_covid_map).to match('<iframe src="https://public.dom')
    end
  end

  describe 'getContent method behavior' do
    it 'method should respond in the class' do
      expect(streamer).to respond_to(:getContent)
    end
    it 'should call soccer content if the options params is soccer' do
      expect(streamer).to receive(:soccer_content).at_least(:once)
      streamer.getContent({ content_type: 'soccer' })
    end
    it 'should call weather widget if the options is weather' do
      expect(streamer).to receive(:get_weather_widget).at_least(:once)
      streamer.getContent({ content_type: 'weather' })
    end
    it 'should call covid map if the options is covid' do
      expect(streamer).to receive(:get_covid_map).at_least(:once)
      streamer.getContent({ content_type: 'covid' })
    end
  end

  # it 'Varify getContent output' do
  #     expect(streamer.getContent({ content_type: 'video', video_name: :rickroll }).class).to be(String)
  #     expect(streamer.getContent({ content_type: 'video', video_name: :rickroll })).to start_with(
  #         "<iframe id='player'",
  #     )
  #     expect(streamer.getContent({ content_type: 'video', video_name: :rickroll })).to end_with('></iframe>')
  #     expect(streamer.getContent({ content_type: 'video', video_name: :rickroll })).to match("'text/html'")
  #     expect(streamer.getContent({ content_type: 'covid' })).to match('https://public.domo.com/cards/YE040')
  # end

  # it 'Test Connection to Soccer Content Server' do
  #     test =
  #         stub_request(:get, 'http://[https//public.domo.com/cards/YE040%5D:80/').to_return(
  #             status: 200,
  #             body: '',
  #             headers: {},
  #         )
  #     puts test
  # end
  # it 'Test connection to Youtube Content Server' do
  #     stub_request(:get, 'http://www.youtube.com/embed/example_for_test').to_return(
  #         status: 200,
  #         body: '<html',
  #         headers: {},
  #     )
  #     uri = URI.parse('http://www.youtube.com/embed/example_for_test?enablejsapi=1&origin=http://example.com')
  #     req = Net::HTTP::Get.new(uri.path)
  #     res = Net::HTTP.start(uri.host, uri.port) { |http| http.request(req) }
  # end

  # it 'Test connection to Covid Map Content Server' do
  #     stub_request(
  #         :get,
  #         'https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=30575;type=3;scode=2;ltid=3458;domid=w209;anc_id=26240;countday=undefined;cmetric=1;wlangID=1;color=137AE9;wwidth=430;header_color=ffffff;text_color=333333;link_color=08488D;border_form=1;footer_color=ffffff;footer_text_color=333333;transparent=0;v=0.0.1',
  #     )
  # end
end
