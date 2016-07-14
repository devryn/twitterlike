class User < ApplicationRecord
  has_many :tweets

  validates :name, presence: true
  validates :handle, presence: true
  validates :name, presence: true
end
