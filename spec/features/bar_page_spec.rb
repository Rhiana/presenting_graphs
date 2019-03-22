RSpec.describe "Bar Page", type: :feature do
  before { visit bar_graphs_path }

  it "has the correct title" do
    expect(page.title).
      to eq("SVG graphs on Rails - All bar graphs")
  end

  it "has a link to create a new graph" do
    expect(page).
      to have_link("New Bar Graph")
  end
end
