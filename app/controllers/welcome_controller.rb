class WelcomeController < ApplicationController
  def show
    @circle = SvgDataPlotterGem::Circle.new({score: 27, total: 100, size: 200})
  end
end
