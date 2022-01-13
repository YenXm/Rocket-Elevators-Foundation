

ActiveAdmin.register_page 'Covid Stats' do
    menu parent: "API +"
    content do
        h1 "!!!!!!!DISABLED!!!!!!!"
        render 'form'
        h1 "Country Selected:", id: "country"
        h2 'Total Confirmed Cases:', id: 'total_confirmed_cases'
        h2 'Newly Confirmed Cases:', id: 'newly_confirmed_cases'
        h2 'Total Deaths:', id: 'total_deaths'
        h2 'New Deaths:', id: 'new_deaths'
        h2 'Total Recovered Cases:', id: 'total_recovered_cases'
        h2 'Newly Recovered Cases:', id: 'newly_recovered_cases'
    end

    controller do
        # def get_covid_stats()
        #     require 'uri'
        #     require 'net/http'
        #     require 'openssl'
         
        #     country = Country.find(params[:country]).country_id
        #     url = URI("https://coronavirus-smartable.p.rapidapi.com/stats/v1/#{country}/")

        #     http = Net::HTTP.new(url.host, url.port)
        #     http.use_ssl = true
        #     http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        #     request = Net::HTTP::Get.new(url)
        #     request["x-rapidapi-host"] = 'coronavirus-smartable.p.rapidapi.com'
        #     request["x-rapidapi-key"] = ENV['COVID_KEY']

        #     response = http.request(request)
        #     render json: response.body
        # end
    end
end
