class Location < ApplicationRecord
    # attr_accessor :address, :latitude, :longitude, :name
    acts_as_gmappable
    has_many :tournaments
 
  def gmaps4rails_address
      address
  end
end
