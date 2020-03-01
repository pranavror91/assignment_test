class Post < ApplicationRecord
  belongs_to :user
  has_many :money_donators
end
