class LineGraphsController < ApplicationController
  before_action :set_line_graph, only: [:show, :edit, :update, :destroy]

  # GET /line_graphs
  # GET /line_graphs.json
  def index
    @line_graphs = LineGraph.all
  end

  # GET /line_graphs/1
  # GET /line_graphs/1.json
  def show
  end

  # GET /line_graphs/new
  def new
    @line_graph = LineGraph.new
  end

  # GET /line_graphs/1/edit
  def edit
  end

  # POST /line_graphs
  # POST /line_graphs.json
  def create
    @line_graph = LineGraph.new(line_graph_params)

    respond_to do |format|
      if @line_graph.save
        format.html { redirect_to line_graphs_url, notice: 'Line graph was successfully created.' }
        format.json { render :index, status: :created, location: @line_graph }
      else
        format.html { render :new }
        format.json { render json: @line_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_graphs/1
  # PATCH/PUT /line_graphs/1.json
  def update
    respond_to do |format|
      if @line_graph.update(line_graph_params)
        format.html { redirect_to line_graphs_url, notice: 'Line graph was successfully updated.' }
        format.json { render :index, status: :ok, location: @line_graph }
      else
        format.html { render :edit }
        format.json { render json: @line_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_graphs/1
  # DELETE /line_graphs/1.json
  def destroy
    @line_graph.destroy
    respond_to do |format|
      format.html { redirect_to line_graphs_url, notice: 'Line graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_graph
      @line_graph = LineGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_graph_params
      params.require(:line_graph).permit(:score1, :score2, :score3)
    end
end
