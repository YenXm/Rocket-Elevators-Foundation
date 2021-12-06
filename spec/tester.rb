require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe ElevatorMedia do
    streamer = ElevatorMedia::Streamer.new
    it 'Varify getContent output' do
        expect(streamer.getContent('test').class).to be(String)
        expect(streamer.getContent('test')).to start_with("<iframe id='player'")
        expect(streamer.getContent('test')).to end_with('></iframe>')
    end
end

RSpec.describe HomeController, type: :controller do
    render_views

    describe 'GET index' do
        it 'Routed to the index page' do
            get :index
            expect(response.body).to match /<div class="slider fullwidthbanner-container roundedcorners">/im
        end
    end
end

RSpec.describe Intervention, type: :model do
    context 'validations' do
        it { should validate_presence_of(:customer_id) }
        it { should validate_presence_of(:building_id) }
    end

    context 'associations' do
        it { should belong_to(:author) }
        it { should belong_to(:building) }
        it { should belong_to(:elevator) }
        it { should belong_to(:battery) }
        it { should belong_to(:customer) }
    end
end
