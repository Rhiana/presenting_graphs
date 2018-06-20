require 'rails_helper'

RSpec.describe PieGraph, type: :model do
  describe "validations" do
    before do
      build(:pie_graph)
    end

    it "has three scores" do
      is_expected.to validate_presence_of(:score1)
      is_expected.to validate_presence_of(:score2)
      is_expected.to validate_presence_of(:score3)
    end
  end
end
