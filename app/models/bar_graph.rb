class BarGraph < ApplicationRecord
  self.table_name = "bar_graphs"

  validates :score1, presence: true, numericality: { only_integer: true }
  validates :score2, presence: true, numericality: { only_integer: true }
end
