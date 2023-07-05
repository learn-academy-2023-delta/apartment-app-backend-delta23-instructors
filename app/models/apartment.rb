class Apartment < ApplicationRecord
  belongs_to :user
  validates :bedrooms, :user_id, :street, presence: true
end
