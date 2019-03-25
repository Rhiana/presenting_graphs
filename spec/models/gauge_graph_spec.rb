require 'rails_helper'

RSpec.describe GaugeGraph, type: :model do
  describe "validations" do
    before do
      build(:circle_graph)
    end

    gauge_graph = GaugeGraph.new(score: "2", total: "5")

    it "has a score and total" do
      is_expected.to validate_presence_of(:score)
      is_expected.to validate_presence_of(:total)
    end

    it "has a score and total which are numbers" do
      is_expected.to validate_numericality_of(:score)
      is_expected.to validate_numericality_of(:total)
    end

    it "has a total which is larger or equal to the score" do
      expect(gauge_graph.score).to be <= gauge_graph.total
    end
  end
end
