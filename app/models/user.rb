class User < ActiveRecord::Base

  before_save :downcase_email

  has_secure_password(validations: false)

  validates :username, :email, :name, :password, presence: true, unless: -> { from_omniauth? }

  validates :email, uniqueness: { case_sensitive: false }, 
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, unless: -> { from_omniauth? }

  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :reviews

  mount_uploader :profile_picture, PhotoUploader

  def admin?
    self.role == 'admin'
  end

  def self.from_omniauth(auth)
    where({:provider => auth['provider'], :uid => auth['uid']}).first_or_initialize.tap do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.oauth_token = auth['credentials']['token']
      user.oauth_expires_at = Time.at(auth['credentials']['expires_at'])
      user.save!
    end
  end

  def from_omniauth?
    provider && uid
  end

  def downcase_email
      self.email.downcase!
  end

end
