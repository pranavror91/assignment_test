class MoneyDonator < ApplicationRecord
  belongs_to :post
  validates :name, :contact_number, presence: true
end
