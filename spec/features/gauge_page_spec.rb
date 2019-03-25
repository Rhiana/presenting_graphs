RSpec.describe "Gauge Page", type: :feature do
  before { visit gauge_graphs_path }

  it "has the correct title" do
    expect(page.title).
      to eq("SVG graphs on Rails - All gauge graphs")
  end

  it "has a link to create a new graph" do
    expect(page).
      to have_link("New Gauge Graph")
  end
end
