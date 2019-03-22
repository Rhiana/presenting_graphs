RSpec.describe "Line Page", type: :feature do
  before { visit line_graphs_path }

  it "has the correct title" do
    expect(page.title).
      to eq("SVG graphs on Rails - All line graphs")
  end

  it "has a link to create a new graph" do
    expect(page).
      to have_link("New Line Graph")
  end
end
