require 'rails_helper'

RSpec.describe "LineGraphs", type: :request do
  describe "GET /line_graphs" do
    it "works! (now write some real specs)" do
      get line_graphs_path
      expect(response).to have_http_status(200)
    end
  end
end
