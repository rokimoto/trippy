class Location < ActiveRecord::Base
  has_many :reviews
  has_many :likes
  belongs_to :category

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

end
