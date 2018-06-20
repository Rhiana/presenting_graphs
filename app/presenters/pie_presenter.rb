class PiePresenter
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
    # Renders the pie_graphs/_pie_graph_svg.html.erb partial,
    # passing in this presenter as a `graph` variable
    @view.render("pie_graphs/pie_graph_svg", graph: self)
  end

  def tag
    @view.tag
  end

  def color
    generator = ColorGenerator.new saturation: 0.5, value: 1.0
    generator.create_hex
  end

  def scores
    [score1, score2, score3]
  end

  def total
    score1 + score2 + score3
  end

  def percentage(score)
    (score / total.to_f) * 100
  end

  def center
    size / 2.0
  end

  def radius
    size / 4.0
  end

  def circumference
    radius * 2 * Math::PI
  end

  def percentage_adj(score)
    (score / total.to_f) * circumference
  end

  def offset(position)
    case position
    when 0
      0
    else
      prev_score = position - 1
      percentage_adj(scores[prev_score]) + offset(prev_score)
    end
  end

  # Draws the circle segments
  def circles
    scores.each_with_index.map do |score, index|
      tag.circle  cx: center,
                  cy: center,
                  r:  radius,
                  style: "stroke-dasharray: #{percentage_adj(score)} #{circumference};
                          stroke: ##{color};
                          stroke-width: #{center};
                          stroke-dashoffset: -#{offset(index)};"
    end.join.html_safe
  end

end
