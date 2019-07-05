class UfoSightingsGem::CLI 

  def initialize 
    intro
    UfoSightingsGem::Scraper.new.scrape_ufo_info
    list_dates
    menu
  end

  def intro
    puts ""
    "I  Want  to  Believe!!".split("").each {|c| putc c ; sleep 0.15}
    sleep +3
    puts "\n\nUFO sightings are a worldwide phenomenon"
    sleep +2.5 
    puts "and reports go back to as far as 1440 BC"
    sleep +2.5
    puts  "where according to the Tulli Papyrus, in Ancient Egypt," 
    sleep +2.5
    puts  "the scribes of the pharaoh Thutmose III reported" 
    sleep +2.5
    puts  "that 'fiery disks' were encountered floating over their skies." 
    sleep +2.5
    puts  "\nThroughout the ages people have reported and documented these occurrences" 
    sleep +3
    puts  "and this is a sampling of them." 
    sleep +2.5
    puts  "\nThe following is a small list of UFO sightings"
    sleep +2.5
    puts  "just within the United States."
    sleep +1
    puts "\nLoading Dates"
    sleep +3.2
    puts ""
  end 

  def list_dates
    UfoSightingsGem::Sighting.all.each.with_index(1) do |sighting, index| 
    "#{index}. #{sighting.date}".split("").each {|c| putc c ; sleep 0.005}
    end
  end
  
  def menu 
    input = nil
    while input != "exit"
      puts "\n- To get additional details on any Date listed,"
      puts "  please enter number of that date."
      puts "- To quit this program, type 'exit'."
      puts "- What would you like to do?"
      puts "- Please enter number or 'exit'"
      
      input = gets.strip.downcase
      
      if input.to_i.between?(1, UfoSightingsGem::Sighting.all.size)
        event = UfoSightingsGem::Sighting.find_date(input)
        "Date - #{event.date}City - #{event.city}State - #{event.state}Description - #{event.description}".split("").each {|c| putc c ; sleep 0.03}
        sleep 3 
        list_dates
      elsif 
        input == "exit"
        goodbye
      else
        "Please enter a valid request, reloading list...".split("").each {|c| putc c ; sleep 0.025}
        puts ""
        sleep 1 
        list_dates
      end
    end 
  end 
  
  def goodbye 
    "\nUntil next time.....".split("").each {|c| putc c ; sleep 0.05}
    puts ""
    "\nThe  Truth  is  out  there!".split("").each {|c| putc c ; sleep 0.15}
    sleep +1
    puts ""
  end 
end 