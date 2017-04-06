class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # association
  has_many :tweets

  # validation
  validates_uniqueness_of :nickname
  validates_presence_of :nickname

  def count_tweets
    tweets.count
  end
end
