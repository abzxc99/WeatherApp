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
# Get current date and time 
t = Time.now;
# using strftime method get value between 0..6 for today
today = t.strftime("%w");
arr = response.forecasts;
arr.each do |item|
  # get value of weekday in forecast response between 0..6 using strftime method
  responseDay = item['date'].strftime("%w"); 
  # convert both strings to an int and check if weekday in response is equal to today.  
  # If yes create a message with "today"
  if (responseDay.to_i == today.to_i)
    puts "Today is going to be #{item['text']} with a low of #{item['low']} and a high of #{item['high']} degrees celcius"
  # else check if weekday in response is equal to tomorrow.
  # if yes craete a message with "Tomorrow"
  elsif(responseDay.to_i == today.to_i + 1 )
    puts "Tomorrow is going to be #{item['text']} with a low of #{item['low']} and a high of #{item['high']} degrees celcius"
  else
    # if not today or tomorrow then print extract the weekday from response to create a message
    puts "#{item['day']} is going to be #{item['text']} with a low of #{item['low']} and a high of #{item['high']} degrees celcius"
  end
end



