class CirclePresenter
  require 'color-generator'
  attr_reader :score, :total, :size

  def initialize(view, score, total, size)
    @view     = view
    @score    = score
    @total    = total
    @size     = size
  end

  def render
    # Renders the circle_graphs/_circle_graph_svg.html.erb partial,
    # passing in this presenter as a `graph` variable
    @view.render("circle_graphs/circle_graph_svg", graph: self)
  end

  def color
    generator = ColorGenerator.new saturation: 0.5, value: 1.0
    generator.create_hex
  end

  def percentage
    (score / total.to_f) * 100
  end

  def center
    size / 2.0
  end

  def radius
    center - 5.0
  end

  def circumference
    radius * 2 * Math::PI
  end

  def percentage_adj
    (score / total.to_f) * circumference
  end

  def radians(degrees)
    degrees * Math::PI / 180
  end

  def x_co_ord(angle)
    rad = radians(angle)
    x   = radius * Math.cos(rad)
    center + x
  end

  def y_co_ord(angle)
    rad = radians(angle)
    y   = radius * Math.sin(rad)
    center - y
  end

  def arc_start
    "#{x_co_ord(90)} #{y_co_ord(90)}"
  end

  def arc_end_rhs
    "#{x_co_ord(270)} #{y_co_ord(270)}"
  end

  def arc_end_lhs
    "#{x_co_ord(90)} #{y_co_ord(90)}"
  end

end
