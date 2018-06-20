require 'rails_helper'

RSpec.describe "PieGraphs", type: :request do
  describe "GET /pie_graphs" do
    it "works! (now write some real specs)" do
      get pie_graphs_path
      expect(response).to have_http_status(200)
    end
  end
end
