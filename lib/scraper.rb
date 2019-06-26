require 'pry'

class Scraper
  
 


  site = "https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States"


  page = Nokogiri::HTML(open(site))
     
  results = page.css("tr")
  
  results.each do |obj|
    date = obj.css("td")[0].text
    location = obj.css("td")[1].text
    state = obj.css("td")[2].text
    name = obj.css("td")[3].text
    description = obj.css("td")[4].text
    binding.pry

  puts results.count
end
end

  # results.each.with_index(1) do |r, index|
  #   puts "#{index} - #{r.text}"
  # end

  # root =
  # url =

  # showpage = Nokogiri::HTML(open(""))

  # title

  
  "Finished Running Code"
  
end
