class Camel < ApplicationRecord
  belongs_to :user
  CATEGORY = ['Apartment', 'City', 'Desert', 'Mountain', 'Speed Race',
  'Water', 'Friendly Camel', 'Horny Camel', 'Fancy Camel', 'Swaggy Camel']

  validates :name, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :location, presence: true
  # validates :price, presence: true
end
