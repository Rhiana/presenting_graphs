require "application_system_test_case"

class BarGraphsTest < ApplicationSystemTestCase
  setup do
    @bar_graph = bar_graphs(:one)
  end

  test "visiting the index" do
    visit bar_graphs_url
    assert_selector "h1", text: "Bar Graphs"
  end

  test "creating a Bar graph" do
    visit bar_graphs_url
    click_on "New Bar Graph"

    fill_in "Score", with: @bar_graph.score
    fill_in "Total", with: @bar_graph.total
    click_on "Create Bar graph"

    assert_text "Bar graph was successfully created"
    click_on "Back"
  end

  test "updating a Bar graph" do
    visit bar_graphs_url
    click_on "Edit", match: :first

    fill_in "Score", with: @bar_graph.score
    fill_in "Total", with: @bar_graph.total
    click_on "Update Bar graph"

    assert_text "Bar graph was successfully updated"
    click_on "Back"
  end

  test "destroying a Bar graph" do
    visit bar_graphs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bar graph was successfully destroyed"
  end
end
