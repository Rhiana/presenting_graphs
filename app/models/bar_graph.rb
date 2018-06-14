class BarGraph < ApplicationRecord
  self.table_name = "bar_graphs"

  validates :score, presence: true, numericality: { only_integer: true, less_than_or_equal_to: :total }
  validates :total, presence: true, numericality: { only_integer: true }
end
