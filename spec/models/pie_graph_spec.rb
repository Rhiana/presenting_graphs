require 'rails_helper'

RSpec.describe PieGraph, type: :model do
  describe "validations" do
    before do
      build(:pie_graph)
    end

    it "has one scores field" do
      is_expected.to validate_presence_of(:scores)
    end
  end
end
