class Location < ActiveRecord::Base
  has_many :reviews
  has_many :likes
  belongs_to :category
end
