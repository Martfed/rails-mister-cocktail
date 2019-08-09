class Review < ApplicationRecord
  belongs_to :cocktail

  validates :star, inclusion: { in: (0..5) }
end
