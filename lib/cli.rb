require "pry"

class CLI 

  def initialize 
    intro
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
    #binding.pry
    Sighting.all.each.with_index(1) do |sighting, index| 
      
       puts "#{index}. #{sighting.name}"
  #Sighting.all.each { |sighting| puts sighting.date}
    
   end
     
    
  end
  
  def menu 
    input = nil
    while input != "exit"
      puts "\nTo get additional details about the City listed, please enter number of that city."
      puts "To quit this program, type 'exit'."
      puts "\nWhat would you like to do?"
      puts "\nEnter number or 'exit'"
      
      input = gets.chomp.downcase
      
      if input.to_i > 0
        puts Sighting.all.each do [input.to_i - 1] 
        end #needs work 
      elsif 
        input == "exit"
        goodbye
      else
        puts "Please type in a valid request"
      end
   
    end 
  end 

  def goodbye 
    puts "Until next time, goodbye."
  end 

end 