class CircleGraph < ApplicationRecord
  self.table_name = "circle_graphs"

  validates :score, :total, presence: true
  validates :score, :total, numericality: { only_integer: true }

  validates :score, numericality: { less_than_or_equal_to: :total }, if: :total

end
