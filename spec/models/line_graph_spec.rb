require 'rails_helper'

RSpec.describe LineGraph, type: :model do
  describe "validations" do
    before do
      build(:line_graph)
    end

    it "has three scores" do
      is_expected.to validate_presence_of(:score1)
      is_expected.to validate_presence_of(:score2)
      is_expected.to validate_presence_of(:score3)
    end

    it "has three scores which are numbers from 0 to 50" do
      should validate_numericality_of(:score1).
                 is_less_than_or_equal_to(50)
      should validate_numericality_of(:score2).
                 is_less_than_or_equal_to(50)
      should validate_numericality_of(:score3).
                 is_less_than_or_equal_to(50)
    end
  end
end
