class BarPresenter
  Y_SCALE = [50, 40, 30, 20, 10, 0]
  require 'color-generator'
  attr_reader :score1, :score2, :height, :width

  def initialize(view, score1, score2, height, width)
    @view     = view
    @score1   = score1
    @score2   = score2
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

  def total
    50
  end

  def scores
    [score1, score2]
  end

  def percentage(score)
    (score / total.to_f) * 100
  end

  def fill(score)
    ((score / total.to_f) * height) - padding[:top]
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
    height - fill(score)
  end

  def x_text_coord(order)
    ((base * order) + base / 2.0) + padding[:left]
  end

  def y_text_coord(score)
    y_coord(score) + 25
  end

  # Defines padding around the graph to make room for the labels
  def padding
    { top: 5.0, right: width, bottom: (height - 5.0), left: 25.0 }
  end

  # Calculates the spacing between the grid lines
  def horizontal_spacing
    (padding[:right] - padding[:left]) / 2
  end

  def vertical_spacing
    (padding[:bottom] - padding[:top]) / (Y_SCALE.length - 1)
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
                height: fill(score),
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
    [1, 2, 3].each_with_index.map do |score, index|
      tag.line  x1: xcord(index),
                x2: xcord(index),
                y1: padding[:top],
                y2: padding[:bottom]
    end.join.html_safe
  end

  def y_grid_lines
    Y_SCALE.each_with_index.map do |scale, index|
      tag.line  x1: padding[:left],
                x2: padding[:right],
                y1: ycord(index),
                y2: ycord(index)
    end.join.html_safe
  end

  # Axis labels
  def scale_labels
    Y_SCALE.each_with_index.map do |scale, index|
      tag.text scale, x: xcord(-0.2), y: ycord(index) + 5
    end.join.html_safe
  end

end
