class Map < ActiveRecord::Base
  validates :name, presence: true,
            length: {minimum: 5, maximum: 64},
            uniqueness: { case_sensitive: false }
end
