require "rails_helper"

RSpec.describe BarGraph, type: :model do
  describe "validations" do
    before do
      build(:bar_graph)
    end

    it "has a score and total" do
      is_expected.to validate_presence_of(:score)
      is_expected.to validate_presence_of(:total)
    end

    it "has a score and total which are numbers" do
      is_expected.to validate_numericality_of(:score)
      is_expected.to validate_numericality_of(:total)
    end
  end
end
