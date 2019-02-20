class Flat < ApplicationRecord
  validates :name, presence: true, allow_empty: false
end
