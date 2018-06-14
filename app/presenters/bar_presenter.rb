class BarPresenter
  require 'color-generator'
  attr_reader :score, :total, :height, :width

  def initialize(view, score, total, height, width)
    @view     = view
    @score    = score
    @total    = total
    @height   = height
    @width    = width
  end

  def render
    # Renders the bar_graphs/_bar_graph_svg.html.erb partial,
    # passing in this presenter as a `graph` variable
    @view.render("bar_graphs/bar_graph_svg", graph: self)
  end

  def percentage
    (score / total.to_f) * 100
  end

  def fill
    (score / total.to_f) * height
  end

  def color
    generator = ColorGenerator.new saturation: 0.3, value: 0.5
    generator.create_hex
  end

  def y_coord
    height - fill
  end

  def y_text_coord
    y_coord + 25
  end

  def x_text_coord
    width / 2.0
  end
end
