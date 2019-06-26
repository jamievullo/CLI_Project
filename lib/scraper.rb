 require 'pry'

class Scraper
  
  
  def self.aliens
    
    sightings_array = []
  
    site = "https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States"
  
    page = Nokogiri::HTML(open(site))
     
    results = page.css("tr")
  
    results.each do |object|
     # binding.pry 
      #if object.css("td").empty? == false 
      if object.css("td")[0] != nil
        date = object.css("td")[0].text
        city = object.css("td")[1].text
        state = object.css("td")[2].text
        name = object.css("td")[3].text
        description = object.css("td")[4].text
      # binding.pry
        sightings_array << Sighting.new(date, city, state, name, description)
      else 
        
       end
    end
    sightings_array
  end
end



