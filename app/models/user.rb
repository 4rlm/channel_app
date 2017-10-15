class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :pw_hash, presence: true
  validates :email, uniqueness: true

  has_many :subscriptions
  has_many :channels, through: :subscriptions

  def password
    @password ||= BCrypt::Password.new(self.pw_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.pw_hash = @password
  end

  def self.authenticate(email, submitted_password)
    user = User.find_by_email(email)
    if user && user.password == submitted_password
      return user
    else
      return nil
    end
  end

end
