class WelcomeController < ApplicationController
  def show
    @circle = SvgDataPlotterGem::Circle.new({score: 27, total: 100, size: 200})
    @gauge  = SvgDataPlotterGem::Gauge.new({score: 65, total: 100, size: 180})
  end
end
