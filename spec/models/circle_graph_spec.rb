require "rails_helper"

RSpec.describe CircleGraph, type: :model do
  describe "validations" do
    before do
      build(:circle_graph)
    end

    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:total) }
  end
end
