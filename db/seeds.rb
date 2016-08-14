# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countries_uri = URI("http://api.geonames.org/countryInfoJSON?username=#{Rails.application.secrets.geoname_key}")
countries_results = JSON.parse(Net::HTTP.get(countries_uri))

ActiveRecord::Base.transaction do
  puts "Seeding countries..."
  countries_results['geonames'].each do |country|

    coordinates_uri = URI("http://ws.geonames.org/searchJSON?country=#{country['countryCode']}&adminCode1=00&maxRows=1&username=#{Rails.application.secrets.geoname_key}")
    coordinates_results = JSON.parse(Net::HTTP.get(coordinates_uri))

    c = Country.create!(name: country['countryName'],
                        geoname_id: country['geonameId'],
                        country_code: country['countryCode'],
                        capital: country['capital'],
                        lat: coordinates_results['geonames'].first['lat'],
                        lng: coordinates_results['geonames'].first['lng'])
  end
  puts "Seeding regions..."

  Country.all.each do |country|

    region_uri = URI("http://api.geonames.org/childrenJSON?geonameId=#{country.geoname_id}&username=#{Rails.application.secrets.geoname_key}")
    region_results = JSON.parse(Net::HTTP.get(region_uri))

    next if !region_results['status'].nil?
    region_results['geonames'].each do |region|
      Region.create!(country_id: country.id,
                     geoname_id: region['geonameId'],
                     name: region['toponymName'],
                     lat: region['lat'],
                     lng: region['lng'])
    end
  end
end
