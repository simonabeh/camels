class Camel < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings

  CATEGORY = ['Apartment', 'City', 'Desert', 'Mountain', 'Speed Race',
  'Water', 'Friendly Camel', 'Horny Camel', 'Fancy Camel', 'Swaggy Camel']

CITY = ['Paris', 'Marseille', 'Rouen', 'Bordeaux', 'Lille', 'Vesoul', 'New York', 'Beyrouth', 'Casablanca', 'Dubai', 'Helsinki']

  validates :name, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :location, presence: true, inclusion: { in: CITY }
  validates :price, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
