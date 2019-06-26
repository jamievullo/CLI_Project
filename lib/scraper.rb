 require 'pry'

class Scraper
  
  
  def self.aliens
    
    sightings_array = []
  
    site = "https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States"
  
    page = Nokogiri::HTML(open(site))
     
    results = page.css("tr")
  
    results.each do |obj|
     # binding.pry 
      if obj.css("td").empty? == false 
      
        date = obj.css("td")[0].text
        city = obj.css("td")[1].text
        state = obj.css("td")[2].text
        name = obj.css("td")[3].text
        description = obj.css("td")[4].text
    
        sightings_array << Sighting.new(date, city, state, name, description)
      else 
        
       end
    end
    sightings_array
  end
end


