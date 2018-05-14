require "application_system_test_case"

class CircleGraphsTest < ApplicationSystemTestCase
  setup do
    @circle_graph = circle_graphs(:one)
  end

  test "visiting the index" do
    visit circle_graphs_url
    assert_selector "h1", text: "Circle Graphs"
  end

  test "creating a Circle graph" do
    visit circle_graphs_url
    click_on "New Circle Graph"

    fill_in "Score", with: @circle_graph.score
    fill_in "Total", with: @circle_graph.total
    click_on "Create Circle graph"

    assert_text "Circle graph was successfully created"
    click_on "Back"
  end

  test "updating a Circle graph" do
    visit circle_graphs_url
    click_on "Edit", match: :first

    fill_in "Score", with: @circle_graph.score
    fill_in "Total", with: @circle_graph.total
    click_on "Update Circle graph"

    assert_text "Circle graph was successfully updated"
    click_on "Back"
  end

  test "destroying a Circle graph" do
    visit circle_graphs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Circle graph was successfully destroyed"
  end
end
