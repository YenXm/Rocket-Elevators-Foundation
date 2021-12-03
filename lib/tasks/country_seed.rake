namespace :country do
    task :populate do
        # Return a list of countries names and codes
        url = URI('http://vocab.nic.in/rest.php/country/json')
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Get.new(url)
        response = http.request(request)

        # {countries: {0: {country: {country_id: "AD", country: "ANDORRA" }}}}
        json = JSON.parse(response.body)

        json = json['countries']

        json.length.times do |i|
            country = json[i]['country']
            Country.create(country_id: country['country_id'], country_name: country['country_name'])
        end
        Country.create(country_id: "global", country_name: "World")
    end
end
