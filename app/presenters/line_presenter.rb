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

  def color
    generator = ColorGenerator.new saturation: 0.5, value: 1.0
    generator.create_hex
  end

  def tag
    @view.tag
  end

  def scores
    [@score1, @score2, @score3]
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

  def increment
    scores.max / 5
  end

  def y_scale
    create_scale(increment, scores.max)
  end

  # Defines padding around the graph to make room for the labels
  def padding
    { top: 5.0, right: (@size - 5.0), bottom: (@size - 5.0), left: 25.0 }
  end

  # Calculates the spacing between the grid lines
  def horizontal_spacing
    (padding[:right] - padding[:left]) / (scores.length - 1)
  end

  def vertical_spacing
    (padding[:bottom] - padding[:top]) / (y_scale.length - 1)
  end

  def xcord(value)
    padding[:left] + (value * horizontal_spacing)
  end

  def ycord(value)
    padding[:top] + (value * vertical_spacing)
  end

  # Calculates where the data points should go
  def score_adj
    vertical_spacing / increment
  end

  def score_cord(value)
    padding[:bottom] - (value * score_adj)
  end

  # Draws the grid lines
  def x_grid_lines
    scores.each_with_index.map do |score, index|
      tag.line  x1: xcord(index),
                x2: xcord(index),
                y1: padding[:top],
                y2: padding[:bottom]
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

  # Puts the data points on the grid
  def data_points
    scores.each_with_index.map do |score, index|
      tag.circle  cx: xcord(index),
                  cy: score_cord(score),
                  r: "5",
                  fill: "##{color}",
                  data: {
                    value: score
                  }
    end.join.html_safe
  end

  def scores_points(prefix = "")
    scores.each_with_index.map do |score, index|
      "#{prefix}#{xcord(index)},#{score_cord(score)}"
    end.join(" ")
  end

  def data_line
    tag.polyline points: scores_points, stroke: "##{color}"
  end

  def area_under_line
    bottom_left   = "M#{padding[:left]},#{padding[:bottom]}"
    bottom_right  = "L#{padding[:right]},#{padding[:bottom]}Z"
    points_line   = scores_points("L")

    tag.path d: "#{bottom_left} #{points_line} #{bottom_right}",
             fill: "##{color}"
  end

end
