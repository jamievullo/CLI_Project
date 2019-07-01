require "pry"

class CLI 

  def initialize 
    #intro
    Scraper.new.scrape_ufo_info
    list_names
    menu
  end

  def intro
    puts ""
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
  end 

  def list_names
    Sighting.all.each.with_index(1) do |sighting, index| 
    puts "#{index}. #{sighting.name}"
    end
  end
  
  def menu 
    input = nil
    while input != "exit"
      puts "\nTo get additional details about the Event listed," 
      puts "please enter number of that event."
      puts "\nTo quit this program, type 'exit'."
      puts "\nWhat would you like to do?"
      puts "\nEnter number or 'exit'"
      
      input = gets.chomp.downcase
      
      if input.to_i > 0
        Sighting.all.each do |sighting| 
          puts "#{sighting.date}, #{sighting.city}, #{sighting.state}, #{sighting.description}"
          #puts name[input.to_i - 1] 
        
        end #needs work
        binding.pry
      elsif 
        input == "exit"
        goodbye
      else
        puts "Please enter a valid request"
      end
   
    end 
  end 

  def goodbye 
    puts "Until next time, goodbye."
  end 

end 