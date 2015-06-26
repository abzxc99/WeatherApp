# require gem 'yahoo_weatherman'
require "yahoo_weatherman"

# method to lookup weather by zipcode using weatherman gem 
def get_weather(location)
  client = Weatherman::Client.new
  response = client.lookup_by_location(location)
end

# Get the zip code user input
puts "Please enter your 5 digit Zip code: "
location = gets.chomp
# Call method to determine the weather in the zip code and return the weather condition 
response = get_weather(location)

# case statement to create a message for weather conditions
case (response.condition['text'].upcase)
  when "SUNNY"
    puts "It's 85 degrees and sunny!"

  when "CLOUDY"
    puts "55 degrees and crazy cloudy!"

  when "RAINY"
    puts "60 degrees and crazy rainy!"

  when "SNOWY"
    puts "32 degrees and super snowy!"

  else
    puts "I am not sure what weather this is"
end
      