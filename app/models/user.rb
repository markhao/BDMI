# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :username, :password_digest, :session_token, presence: true
  validates :email, :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :images, as: :imageable
  has_many :reviews, foreign_key: :author_id, class_name: :Review
  has_many :likes, foreign_key: :author_id, class_name: :Like
  has_many :want_watchs, foreign_key: :user_id, class_name: :Wantwatchmovie
  has_many :wanted_movies, through: :want_watchs, source: :movie
  has_many :has_watcheds, foreign_key: :user_id, class_name: :Watchedmovie
  has_many :watched_movies, through: :has_watcheds, source: :movie

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(emailOrUsername,password)
    user = User.find_by(email: emailOrUsername)
    user ||= User.find_by(username: emailOrUsername)
    return nil unless user && user.is_password?(password)
    user
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
