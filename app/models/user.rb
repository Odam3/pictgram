class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  validates :password, length: { in: 8..32 }
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  # def favorite_topics
    
  # end
  
  
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
end
