class BarGraph < ApplicationRecord
  self.table_name = "bar_graphs"

  validates :score1, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 50 }
  validates :score2, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 50 }
end
