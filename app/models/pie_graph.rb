class PieGraph < ApplicationRecord
  self.table_name = "pie_graphs"

  validates :score1, :score2, :score3, presence: true, numericality: { only_integer: true }
end
