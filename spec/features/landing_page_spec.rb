RSpec.describe "Landing Page", type: :feature do
  before { visit root_path }

  it "has the correct title" do
    expect(page.title).
      to eq("Presenting Graphs")
  end

  it "has a link to the code" do
    expect(page).
      to have_link("code on Github")
  end
end
