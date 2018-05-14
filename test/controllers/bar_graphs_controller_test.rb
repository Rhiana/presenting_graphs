require 'test_helper'

class BarGraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bar_graph = bar_graphs(:one)
  end

  test "should get index" do
    get bar_graphs_url
    assert_response :success
  end

  test "should get new" do
    get new_bar_graph_url
    assert_response :success
  end

  test "should create bar_graph" do
    assert_difference('BarGraph.count') do
      post bar_graphs_url, params: { bar_graph: { score: @bar_graph.score, total: @bar_graph.total } }
    end

    assert_redirected_to bar_graph_url(BarGraph.last)
  end

  test "should show bar_graph" do
    get bar_graph_url(@bar_graph)
    assert_response :success
  end

  test "should get edit" do
    get edit_bar_graph_url(@bar_graph)
    assert_response :success
  end

  test "should update bar_graph" do
    patch bar_graph_url(@bar_graph), params: { bar_graph: { score: @bar_graph.score, total: @bar_graph.total } }
    assert_redirected_to bar_graph_url(@bar_graph)
  end

  test "should destroy bar_graph" do
    assert_difference('BarGraph.count', -1) do
      delete bar_graph_url(@bar_graph)
    end

    assert_redirected_to bar_graphs_url
  end
end
