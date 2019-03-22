class LineGraph < ApplicationRecord
  self.table_name = "line_graphs"

  validates :scores, presence: true
  validates :maximum, presence: true, numericality: { only_integer: true }
  validate :score_value_range

  # Overrides the default method and turns the string into an array
  def scores=(value)
    if value.is_a? String
      value = value.split(/[, ]+/).reject(&:blank?)
    end
    super
  end

  def score_value_range
    return unless scores
    return unless maximum
    scores.each do |score|
      if score > maximum
        errors.add(:scores, "Each score must be smaller or equal to the maximum score")
      elsif score < 0
        errors.add(:scores, "Each score must be larger or equal to 0")
      end
    end
  end
end
