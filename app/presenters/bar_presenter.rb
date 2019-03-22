class BarPresenter
  require 'color-generator'
  attr_reader :scores, :maximum, :height, :width

  def initialize(view, scores, maximum, height, width)
    @view     = view
    @scores   = scores
    @maximum  = maximum
    @height   = height
    @width    = width
  end

  def render
    # Renders the bar_graphs/_bar_graph_svg.html.erb partial,
    # passing in this presenter as a `graph` variable
    @view.render("bar_graphs/bar_graph_svg", graph: self)
  end

  def tag
    @view.tag
  end

  def create_scale(inc, max)
    x = [0]
    y = 0
    while y < max
      y = y + inc
      x.push(y)
    end
    return x.reverse
  end

  def y_scale
    create_scale(20, 100)
  end

  def x_scale
    number_of_lines = scores.length + 1
    (1 .. number_of_lines)
  end

  def percentage(score)
    (score / maximum.to_f) * 100
  end

  def fill_height(score)
    margins     = padding[:top] + padding[:bottom]
    rect_height = (score / maximum.to_f) * (height - margins)
  end

  def base
    (width - padding[:left]) / scores.length
  end

  def color
    generator = ColorGenerator.new saturation: 0.3, value: 0.5
    generator.create_hex
  end

  def x_coord(order)
    (base * order) + padding[:left]
  end

  def y_coord(score)
    height - fill_height(score) - padding[:bottom]
  end

  def x_text_coord(order)
    ((base * order) + base / 2.0) + padding[:left]
  end

  def y_text_coord(score)
    y_coord(score) + 20
  end

  # Defines padding around the graph to make room for the labels
  def padding
    { top: 5.0, right: width, bottom: 5.0, left: 25.0 }
  end

  def bottom_axis
    height - padding[:bottom]
  end

  # Calculates the spacing between the grid lines
  def horizontal_spacing
    (padding[:right] - padding[:left]) / scores.length
  end

  def vertical_spacing
    (bottom_axis - padding[:top]) / (y_scale.length - 1)
  end

  def xcord(value)
    padding[:left] + (value * horizontal_spacing)
  end

  def ycord(value)
    padding[:top] + (value * vertical_spacing)
  end

  # Draws the bars
  def bars
    scores.each_with_index.map do |score, index|
      tag.rect  width: base,
                height: fill_height(score),
                fill: "##{color}",
                x: x_coord(index),
                y: y_coord(score)
    end.join.html_safe
  end

  def labels
    scores.each_with_index.map do |score, index|
      tag.text  "#{percentage(score).to_i}%",
                x: x_text_coord(index),
                y: y_text_coord(score)
    end.join.html_safe
  end

  # Draws the grid lines
  def x_grid_lines
    x_scale.each_with_index.map do |score, index|
      tag.line  x1: xcord(index),
                x2: xcord(index),
                y1: padding[:top],
                y2: bottom_axis
    end.join.html_safe
  end

  def y_grid_lines
    y_scale.each_with_index.map do |scale, index|
      tag.line  x1: padding[:left],
                x2: padding[:right],
                y1: ycord(index),
                y2: ycord(index)
    end.join.html_safe
  end

  # Axis labels
  def scale_labels
    y_scale.each_with_index.map do |scale, index|
      tag.text scale, x: xcord(-0.2), y: ycord(index) + 5
    end.join.html_safe
  end

end
