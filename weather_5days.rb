# require gem yahoo_weatherman 
require "yahoo_weatherman"

# # method to lookup weather by zipcode using weatherman gem 
def get_weather(location)
  client = Weatherman::Client.new
  response = client.lookup_by_location(location)
end

# Get the zip code user input
puts "Please enter your 5 digit Zip code: "
location = gets.chomp
# Call method to determine the weather in the zip code and return the weather condition 
response = get_weather(location)

puts "\n\nResponse forecasts\n"
arr = response.forecasts
arr.each do |item|
  puts "#{item['day']} is going to be #{item['text']} with a low of #{item['low']} and a high of #{item['high']} degrees celcius"
end

