class PiePresenter
  require 'color-generator'
  attr_reader :scores, :size

  def initialize(view, scores, size)
    @view     = view
    @scores   = scores
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

  def total
    scores.reduce(0, :+)
  end

  def percentage(score)
    (score / total.to_f) * 100
  end

  def full_circle
    scores.length == 1
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

  def percent_to_degrees(score)
    (percentage(score)) * 3.6
  end

  def text_offset(position)
    position_offset = 0
    (0 .. position).each do | p |
      if p == position
        new_offset = percent_to_degrees(scores[p]) / 2.0
      else
        new_offset = percent_to_degrees(scores[p])
      end
      position_offset += new_offset
    end

    return position_offset
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

  def labels
    scores.each_with_index.map do |score, index|
      tag.text  "#{percentage(score).to_i}%",
                x: full_circle ? y_co_ord(-text_offset(index)) : x_co_ord(-text_offset(index)),
                y: y_co_ord(-text_offset(index))
    end.join.html_safe
  end

end
