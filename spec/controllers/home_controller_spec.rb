require "rails_helper"


RSpec.describe HomeController, :type => :controller do
  render_views

  describe "GET index" do
    it "has a " do
      get :index
      expect(response.body).to match /<div class="slider fullwidthbanner-container roundedcorners">/im
    end
  end
end