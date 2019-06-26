 require 'pry'

class Scraper
  
  
  def self.aliens
    
    sightings_array = []
  
    site = "https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States"
  
    page = Nokogiri::HTML(open(site))
     
    results = page.css("tr")
  
    results.each do |object|
    row_data = object.css('td')
      if row_data[0] != nil && row_data[1] != nil && row_data[3] != nil
        date = row_data[0].text
        city = row_data[1].text
        state = row_data[2].text
        name = row_data[3].text
        description = row_data[4].text
       # binding.pry 
        sightings_array << Sighting.new(date, city, state, name, description)
      end
    end
    print sightings_array
  end
end



