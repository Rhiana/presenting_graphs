RSpec.describe "Circle Page", type: :feature do
  before { visit circle_graphs_path }

  it "has the correct title" do
    expect(page.title).
      to eq("Presenting Graphs - All circle graphs")
  end

  it "has a link to create a new graph" do
    expect(page).
      to have_link("New Circle Graph")
  end
end
