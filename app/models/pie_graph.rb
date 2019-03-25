class PieGraph < ApplicationRecord
  self.table_name = "pie_graphs"

  validates :scores, presence: true
  validate :score_values

  # Overrides the default method and turns the string into an array
  def scores=(value)
    if value.is_a? String
      value = value.split(/[, ]+/).reject(&:blank?)
    end
    super
  end

  def score_values
    return unless scores
    scores.each do |score|
      if score < 0
        errors.add(:scores, "Each score must be larger or equal to 0")
      end
    end
  end

end
