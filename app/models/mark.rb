class Mark < ActiveRecord::Base
  belongs_to :map

  validates :description, length: {maximum: 255}
  validates :lat, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
