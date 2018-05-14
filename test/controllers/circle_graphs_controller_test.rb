require 'test_helper'

class CircleGraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circle_graph = circle_graphs(:one)
  end

  test "should get index" do
    get circle_graphs_url
    assert_response :success
  end

  test "should get new" do
    get new_circle_graph_url
    assert_response :success
  end

  test "should create circle_graph" do
    assert_difference('CircleGraph.count') do
      post circle_graphs_url, params: { circle_graph: { score: @circle_graph.score, total: @circle_graph.total } }
    end

    assert_redirected_to circle_graph_url(CircleGraph.last)
  end

  test "should show circle_graph" do
    get circle_graph_url(@circle_graph)
    assert_response :success
  end

  test "should get edit" do
    get edit_circle_graph_url(@circle_graph)
    assert_response :success
  end

  test "should update circle_graph" do
    patch circle_graph_url(@circle_graph), params: { circle_graph: { score: @circle_graph.score, total: @circle_graph.total } }
    assert_redirected_to circle_graph_url(@circle_graph)
  end

  test "should destroy circle_graph" do
    assert_difference('CircleGraph.count', -1) do
      delete circle_graph_url(@circle_graph)
    end

    assert_redirected_to circle_graphs_url
  end
end
