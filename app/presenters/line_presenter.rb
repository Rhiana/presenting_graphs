class LinePresenter
  require 'color-generator'
  attr_reader :score1, :score2, :score3, :size

  def initialize(view, score1, score2, score3, size)
    @view     = view
    @score1   = score1
    @score2   = score2
    @score3   = score3
    @size     = size
  end

  def render
    # Renders the circle_graphs/_circle_graph_svg.html.erb partial,
    # passing in this presenter as a `graph` variable
    @view.render("line_graphs/line_graph_svg", graph: self)
  end
end
