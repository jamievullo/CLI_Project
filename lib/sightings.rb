class Sighting
  
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
    
  
end