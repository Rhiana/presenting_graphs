RSpec.describe "Pie Page", type: :feature do
  before { visit pie_graphs_path }

  it "has the correct title" do
    expect(page.title).
      to eq("SVG graphs on Rails - All pie graphs")
  end

  it "has a link to create a new graph" do
    expect(page).
      to have_link("New Pie Graph")
  end
end
