class LineGraph < ApplicationRecord
  self.table_name = "line_graphs"

  validates :score1, :score2, :score3, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 50 }
end
