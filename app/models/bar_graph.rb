class BarGraph < ApplicationRecord
  self.table_name = "bar_graphs"

  validates :score, :total, presence: true, allow_nil: false
end
