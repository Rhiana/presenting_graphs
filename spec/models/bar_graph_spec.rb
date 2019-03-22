require "rails_helper"

RSpec.describe BarGraph, type: :model do
  describe "validations" do
    before do
      build(:bar_graph)
    end

    it "has a scores array and maximum" do
      is_expected.to validate_presence_of(:scores)
      is_expected.to validate_presence_of(:maximum)
    end

    it "has a maximum which is a number" do
      should validate_numericality_of(:maximum)
    end
  end
end
