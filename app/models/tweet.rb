class Tweet < ApplicationRecord
  belongs_to :user

  validates :body
  validates :user_id
end
