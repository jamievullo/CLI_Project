class UfoSightingsGem::CLI

  def run
    intro
    UfoSightingsGem::Scraper.scrape_ufo_info
    list_dates
    menu
    input_checker
  end

  def intro
    puts ""
    "I  Want  to  Believe!!".colorize(:yellow).bold.split("").each {|c| putc c ; sleep 0.15}
    sleep +3
    puts "\n\nUFO sightings are a worldwide phenomenon".colorize(:yellow).bold
    sleep +2.5
    puts "and reports go back to as far as 1440 BC".colorize(:yellow).bold
    sleep +2.5
    puts  "where according to the Tulli Papyrus, in Ancient Egypt,".colorize(:yellow).bold
    sleep +2.5
    puts  "the scribes of the pharaoh Thutmose III reported".colorize(:yellow).bold
    sleep +2.5
    puts  "that 'fiery disks' were encountered floating over their skies.".colorize(:yellow).bold
    sleep +2.5
    puts  "\nThroughout the ages people have reported and documented these occurrences".colorize(:yellow).bold
    sleep +3
    puts  "and this is a sampling of them.".colorize(:yellow).bold
    sleep +2.5
    puts  "\nThe following is a very small list of UFO sightings".colorize(:yellow).bold
    sleep +2.5
    puts  "just within the United States.".colorize(:yellow).bold
    sleep +1
    puts "\nLoading Dates....".colorize(:yellow).bold
    sleep +3.2
    puts ""
  end

  def list_dates
    UfoSightingsGem::Sighting.all.each.with_index(1) do |sighting, index|
    "#{index}. #{sighting.date}".colorize(:yellow).bold.split("").each {|c| putc c ; sleep 0.003}
    end
  end

  def menu
    puts "\n- To get additional details on any Date listed,".colorize(:yellow).bold
    puts "  please enter number of that date.".colorize(:yellow).bold
    puts "- To quit this program, type 'exit'.".colorize(:yellow).bold
    puts "- What would you like to do?".colorize(:yellow).bold
    puts "- Please enter number or 'exit'".colorize(:yellow).bold
  end

  def input_checker
      input = nil
    while input != "exit"
     input = gets.strip.downcase

      if input.to_i.between?(1, UfoSightingsGem::Sighting.all.size)
        sighting_output(input.to_i)
      elsif
        input == "exit"
        goodbye
      else
        invalid_response
      end
    end
  end

   def sighting_output(input)
    event = UfoSightingsGem::Sighting.finder(input)
    "Date - #{event.date}City - #{event.city}State - #{event.state}Event - #{event.name}Description - #{event.description}".colorize(:blue).bold.split("").each {|c| putc c ; sleep 0.035}
    puts "\nReloading list....".colorize(:yellow).bold
    sleep 3
    list_dates
    menu
  end

  def invalid_response
    "Please enter a valid request, reloading list...".colorize(:red).bold.split("").each {|c| putc c ; sleep 0.025}
    puts ""
    sleep 1
    list_dates
    menu
  end

  def goodbye
    "\nUntil next time.....".colorize(:yellow).bold.split("").each {|c| putc c ; sleep 0.05}
    puts ""
    "\nThe  Truth  is  out  there!".colorize(:yellow).bold.split("").each {|c| putc c ; sleep 0.15}
    sleep +1
    puts ""
    exit
  end
end
