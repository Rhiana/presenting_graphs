class CircleGraph < ApplicationRecord
  self.table_name = "circle_graphs"

  validates :score, :total, presence: true, allow_nil: false
end
