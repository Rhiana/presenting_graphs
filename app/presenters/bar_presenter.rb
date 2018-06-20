class BarPresenter
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
    [@score1, @score2]
  end

  def percentage(score)
    (score / total.to_f) * 100
  end

  def fill(score)
    (score / total.to_f) * height
  end

  def base
    width / scores.length
  end

  def color
    generator = ColorGenerator.new saturation: 0.3, value: 0.5
    generator.create_hex
  end

  def x_coord(order)
    base * order
  end

  def y_coord(score)
    height - fill(score)
  end

  def x_text_coord(order)
    (base * order) + base / 2.0
  end

  def y_text_coord(score)
    y_coord(score) + 25
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

end
