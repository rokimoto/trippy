class Review < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :comments

  mount_uploader :photo, PhotoUploader

end
