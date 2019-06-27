class CLI 
  
  # Program will display a welcome message with a numbered list of 
  # dates of UFO sightings across the USA along with some program 
  # instructions. The user will have the option of selecting the 
  # particular date of interest by number or exiting the program.
  # Once selected, the program will display the selected event with 
  # the city, state, event name, and description of the event along 
  # with an option to go back to the list of dates to check out 
  # other events as well.
  
    def call 
    input = ""
    while input != "exit"
        #Definitely want to add a speed element here for the welcome message.
        
        puts "I Want to Believe"
    
        puts "UFO sightings are a worldwide phenomenon 
              and reports go back to as far as 1440 BC 
              where according to the Tulli Papyrus, in Ancient Egypt, 
              the scribes of the pharaoh Thutmose III reported 
              that 'fiery disks' were encountered floating over the skies. 
              Throughout the ages people have reported and documented these occurrences 
              and this is just a small sampling of them. 
              The following is a list of UFO sightings 
              just within the United States."

        puts "The truth is out there"
        
        puts "To list all of the Dates where these events took place please enter 'list dates'"

        puts "To list all of the Cities where these events took place please enter 'list cities'"
        
        puts "To quit this program, type 'exit'."
        
        puts "What would you like to do? Enter 'list dates', 'list cities', or 'exit'"
        input = gets.chomp #strip?
        
        case input
        when 'list dates'
          self.list_dates
        when 'list cities'
          self.list_cities
        
        else
          "Please type in a valid request please"
      end
        
    end
  end
  
  #Going to need a Dates class and a Cities class
  def list_dates
    Dates.all.sort_by(&:name).each.with_index(1) do |dates, index|
      puts "#{index}. #{dates.name}"
    end
  end
  
  def list_cities
    Cities.all.sort_by(&:name).each.with_index(1) do |cities, index|
      puts "#{index}. #{cities.name}"
    end 
  end
  
  
end