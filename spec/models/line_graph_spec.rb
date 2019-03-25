require 'rails_helper'

RSpec.describe LineGraph, type: :model do
  describe "validations" do
    before do
      build(:line_graph)
    end

    line_graph = LineGraph.new(scores: "0, 5", maximum: "5")

    it "has a scores array and maximum" do
      is_expected.to validate_presence_of(:scores)
      is_expected.to validate_presence_of(:maximum)
    end

    it "has a maximum which is a number" do
      should validate_numericality_of(:maximum)
    end

    it "has the maximum be the largest or equal largest value" do
      line_graph.scores.each do | score |
        expect(score).to be <= line_graph.maximum
      end
    end

    it "has only positive score values" do
      line_graph.scores.each do | score |
        expect(score).to be >= 0
      end
    end
  end
end
