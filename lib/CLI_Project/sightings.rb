class UfoSightingsGem::Sighting
  
  attr_accessor :date, :city, :state, :name, :description
  
  @@all = []
  
  def initialize(date, city, state, name, description)
    @date = date
    @city = city
    @state = state
    @name = name
    @description = description
    @@all << self
  end
  
  def self.all 
    @@all 
  end 
  
  def self.find_date(user_input)
    self.all[user_input.to_i - 1]
  end

end