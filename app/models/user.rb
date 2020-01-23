class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
 validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
validates :name, presence: true, length: { maximum: 15}

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end