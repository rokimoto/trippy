class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, :name, :password, presence: true
  validates :password, length: { minimum: 8 }, :inclusion => 1..10
  has_many :comments
  has_many :reviews

  def admin?
    self.role == 'admin'
  end

end
