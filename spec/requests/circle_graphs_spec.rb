require 'rails_helper'

RSpec.describe "CircleGraphs", type: :request do
  describe "GET /circle_graphs" do
    it "works! (now write some real specs)" do
      get circle_graphs_path
      expect(response).to have_http_status(200)
    end
  end
end
