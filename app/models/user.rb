class User < ApplicationRecord
  attr_reader :password

  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, :password_digest, :username, presence: true

  has_many :subs,
  class_name: :Sub,
  foreign_key: :moderator_id,
  primary_key: :id,
  inverse_of: :moderator

  has_many :posts,
  inverse_of: :author

  has_many :comments,
  inverse_of: :author

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    if user.valid_password?(password)
      return user
    else
      return nil
    end
  end
end
