class UfoSightingsGem::Scraper
 
  def self.scrape_ufo_info
  
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
        
        unless UfoSightingsGem::Sighting.all.count >= 42 
          UfoSightingsGem::Sighting.create(date, city, state, name, description)
        end
      end
    end
  end
end

