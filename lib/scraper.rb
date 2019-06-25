class Scraper
  
  require 'nokogiri'
require 'open-uri'


site = "https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States"


page = Nokogiri::HTML(open(site))
 #puts page #|| 'nope'
results = page.css(".nowrap")
#puts results.count

results.each.with_index(1) do |r, index|
  puts "#{index} - #{r.text}"
end

# root =
# url =

# showpage = Nokogiri::HTML(open(""))

# title


"Finished Running Code"
  
end
