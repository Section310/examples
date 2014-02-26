require 'rest_client'
require 'csv'

#FORMAT = 'CSV'
#OUTPUT_FILE = data.csv

#data = RestClient.get "http://business.usa.gov/api/ss/#{FORMAT}"
#File.open(OUTPUT_FILE, 'w') {|f| f.write(data) }

#count = 0
#CSV.foreach("OUTPUT_FILE") do |row|
  #count += 1   
#end

#puts "There are #{count} rows in this CSV file"

require "json"
data = RestClient.get "http://localhost:4567"
puts data
parsed_data = JSON.parse(data)
puts parsed_data['key']