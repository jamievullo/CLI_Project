class CLI 
  
 
    def run 
      call 
      display_dates
      display_cities
    end
  
    def call 
      input = ""
      while input != "exit"
        
       "I  Want  to  Believe!!".split("").each {|c| putc c ; sleep 0.20}
        sleep +3
        puts "\n\nUFO sightings are a worldwide phenomenon"
        sleep +2.5 
        puts "and reports go back to as far as 1440 BC"
        sleep +2.5
        puts  "where according to the Tulli Papyrus, in Ancient Egypt," 
        sleep +2.5
        puts  "the scribes of the pharaoh Thutmose III reported" 
        sleep +2.5
        puts  "that 'fiery disks' were encountered floating over the skies." 
        sleep +2.5
        puts  "\nThroughout the ages people have reported and documented these occurrences" 
        sleep +2.7
        puts  "and this is just a small sampling of them." 
        sleep +4
        puts  "\nThe following is a list of UFO sightings"
        sleep +2.5
        puts  "just within the United States."
        sleep +4
        
        "\nThe  Truth  is  out  there!".split("").each {|c| putc c ; sleep 0.20}
        sleep +3
        puts ""
        puts "\nTo list all of the Dates where these events took place please enter 'list dates'"
        
        puts "To list all of the Cities where these events took place please enter 'list cities'"
        
        puts "To quit this program, type 'exit'."
        sleep +3
        puts "\nWhat would you like to do?" 
        puts "Enter 'list dates', 'list cities', or 'exit'"
        input = gets.chomp 
        
        case input
        when 'list dates'
          self.display_dates
        when 'list cities'
          self.display_cities
        when 'exit'
          puts "Thank you!"
        else
          "Please type in a valid request"
      end
        
    end
  end    
  
 
  def display_dates
    Scraper.all.sort_by(&:name).each.with_index(1) do |dates, index|
      puts "#{index}. #{dates.name}"
    end
  end
  
  def display_cities
    Scraper.all.sort_by(&:name).each.with_index(1) do |cities, index|
      puts "#{index}. #{cities.name}"
    end 
  end
end