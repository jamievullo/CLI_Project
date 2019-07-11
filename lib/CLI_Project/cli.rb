class UfoSightingsGem::CLI 

  def initialize
    run 
  end
  
  def run  
    intro
    UfoSightingsGem::Scraper.new.scrape_ufo_info
    list_dates
    menu
  end

  def intro
    puts ""
    "I  Want  to  Believe!!".colorize(:yellow).split("").each {|c| putc c ; sleep 0.15}
    sleep +3
    puts "\n\nUFO sightings are a worldwide phenomenon".colorize(:yellow)
    sleep +2.5 
    puts "and reports go back to as far as 1440 BC".colorize(:yellow)
    sleep +2.5
    puts  "where according to the Tulli Papyrus, in Ancient Egypt,".colorize(:yellow)
    sleep +2.5
    puts  "the scribes of the pharaoh Thutmose III reported".colorize(:yellow) 
    sleep +2.5
    puts  "that 'fiery disks' were encountered floating over their skies.".colorize(:yellow) 
    sleep +2.5
    puts  "\nThroughout the ages people have reported and documented these occurrences".colorize(:yellow) 
    sleep +3
    puts  "and this is a sampling of them.".colorize(:yellow) 
    sleep +2.5
    puts  "\nThe following is a very small list of UFO sightings".colorize(:yellow)
    sleep +2.5
    puts  "just within the United States.".colorize(:yellow)
    sleep +1
    puts "\nLoading Dates....".colorize(:yellow)
    sleep +3.2
    puts ""
  end 

  def list_dates
    UfoSightingsGem::Sighting.all.each.with_index(1) do |sighting, index| 
    "#{index}. #{sighting.date}".colorize(:green).split("").each {|c| putc c ; sleep 0.005}
    end
  end
  
  def menu 
    input = nil
    while input != "exit"
      puts "\n- To get additional details on any Date listed,".colorize(:green)
      puts "  please enter number of that date.".colorize(:green)
      puts "- To quit this program, type 'exit'.".colorize(:green)
      puts "- What would you like to do?".colorize(:green)
      puts "- Please enter number or 'exit'".colorize(:green)
      
      input = gets.strip.downcase
      
      if input.to_i.between?(1, UfoSightingsGem::Sighting.all.size)
        event = UfoSightingsGem::Sighting.find_date(input)
        "Date - #{event.date}City - #{event.city}State - #{event.state}Event - #{event.name}Description - #{event.description}".colorize(:light_blue).split("").each {|c| putc c ; sleep 0.035}
        puts "\nReloading list....".colorize(:yellow)
        sleep 3 
        list_dates
      elsif 
        input == "exit"
        goodbye
      else
        "Please enter a valid request, reloading list...".colorize(:red).split("").each {|c| putc c ; sleep 0.025}
        puts ""
        sleep 1 
        list_dates
      end
    end 
  end 
  
  def goodbye 
    "\nUntil next time.....".colorize(:yellow).split("").each {|c| putc c ; sleep 0.05}
    puts ""
    "\nThe  Truth  is  out  there!".colorize(:yellow).split("").each {|c| putc c ; sleep 0.15}
    sleep +1
    puts ""
    exit
  end 
end 