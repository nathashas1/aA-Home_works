require 'bcrypt'



class User < ApplicationRecord
  validates :username,  presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(name,pwd)
    u1 = User.find_by(username: name)
    if u1 &&  BCrypt::Password.new(u1.password_digest).is_password?(pwd)
      return u1
    else
      nil
    end
  end


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_pwd)
    @password = new_pwd
    self.password_digest = BCrypt::Password.create(new_pwd)
  end
end
