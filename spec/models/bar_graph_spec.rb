require "rails_helper"

RSpec.describe BarGraph, type: :model do
  describe "validations" do
    before do
      build(:bar_graph)
    end

    it "has two scores" do
      is_expected.to validate_presence_of(:score1)
      is_expected.to validate_presence_of(:score2)
    end

    it "has two scores which are numbers from 0 to 50" do
      should validate_numericality_of(:score1).
                 is_less_than_or_equal_to(50)
      should validate_numericality_of(:score2).
                 is_less_than_or_equal_to(50)
    end
  end
end
