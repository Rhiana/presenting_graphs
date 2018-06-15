require 'rails_helper'

RSpec.describe "GaugeGraphs", type: :request do
  describe "GET /gauge_graphs" do
    it "works! (now write some real specs)" do
      get gauge_graphs_path
      expect(response).to have_http_status(200)
    end
  end
end
