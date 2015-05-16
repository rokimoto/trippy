class Review < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :content, :rating, presence: true



  def has_photo?
    self.photo.url
  end

end
