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
  
  def self.all 
    @@all 
  end 
  
  def self.find_date(info)
    self.all[info.to_i - 1]
  end
  
   
  
end