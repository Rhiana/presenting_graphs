class LineGraph < ApplicationRecord
  self.table_name = "line_graphs"

  validates :scores, presence: true
  validates :maximum, presence: true, numericality: { only_integer: true }

  # Overrides the default method and turns the string into an array
  def scores=(value)
    if value.is_a? String
      value = value.split(/[, ]+/).reject(&:blank?)
    end
    super
  end
end
