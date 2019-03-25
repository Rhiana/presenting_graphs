require 'rails_helper'

RSpec.describe PieGraph, type: :model do
  describe "validations" do
    before do
      build(:pie_graph)
    end

    pie_graph = PieGraph.new(scores: "0, 5")

    it "has one scores field" do
      is_expected.to validate_presence_of(:scores)
    end

    it "has only positive score values" do
      pie_graph.scores.each do | score |
        expect(score).to be >= 0
      end
    end
  end
end
