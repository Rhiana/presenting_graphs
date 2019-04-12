module ApplicationHelper
  def generate_light_color
    generator = ColorGenerator.new saturation: 0.5, value: 1.0
    generator.create_hex
  end
end
