# encoding: UTF-8
require 'rest_client'
require 'csv'

FORMAT = 'CSV'
OUTPUT_FILE = 'data.csv'

# we found these apis on http://business.usa.gov/apis
data = RestClient.get "http://business.usa.gov/api/ss/#{FORMAT}"

data = data.force_encoding('BINARY').encode('UTF-8', :invalid => :replace, :undef => :replace, :replace => '').delete!("\r").gsub(/\" \n/,"\"\n").gsub(/\\\"/,"__")

File.open(OUTPUT_FILE, 'w') {|f| f.write(data) }

count = 0
CSV.foreach(OUTPUT_FILE) do |row|
  puts row if count == 0
  count += 1   
end

puts "There are #{count} rows in this CSV file"