class UfoSightingsGem::Sighting
  
  attr_accessor :date, :city, :state, :name, :description
  
  @@all = []
  
  def initialize(date, city, state, name, description)
    @date = date
    @city = city
    @state = state
    @name = name
    @description = description
  end
  
  def save
    @@all << self
  end
  
  def self.create(date, city, state, name, description)
    sighting = UfoSightingsGem::Sighting.new(date, city, state, name, description)
    sighting.save
  end
  
  def self.all 
    @@all 
  end 
  
  def self.finder(user_input)
    self.all[user_input - 1]
  end

end