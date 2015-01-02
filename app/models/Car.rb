class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
end
