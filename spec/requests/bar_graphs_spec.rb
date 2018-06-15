require 'rails_helper'

RSpec.describe "BarGraphs", type: :request do
  describe "GET /bar_graphs" do
    it "works! (now write some real specs)" do
      get bar_graphs_path
      expect(response).to have_http_status(200)
    end
  end
end
