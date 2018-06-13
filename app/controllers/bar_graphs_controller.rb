class BarGraphsController < ApplicationController
  before_action :set_bar_graph, only: [:show, :edit, :update, :destroy]

  # GET /bar_graphs
  # GET /bar_graphs.json
  def index
    @bar_graphs = BarGraph.all
  end

  # GET /bar_graphs/1
  # GET /bar_graphs/1.json
  def show
  end

  # GET /bar_graphs/new
  def new
    @bar_graph = BarGraph.new
  end

  # GET /bar_graphs/1/edit
  def edit
  end

  # POST /bar_graphs
  # POST /bar_graphs.json
  def create
    @bar_graph = BarGraph.new(bar_graph_params)

    respond_to do |format|
      if @bar_graph.save
        format.html { redirect_to action: "index", notice: 'Bar graph was successfully created.' }
        format.json { render :index, status: :created, location: @bar_graph }
      else
        format.html { render :new }
        format.json { render json: @bar_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bar_graphs/1
  # PATCH/PUT /bar_graphs/1.json
  def update
    respond_to do |format|
      if @bar_graph.update(bar_graph_params)
        format.html { redirect_to action: "index", notice: 'Bar graph was successfully updated.' }
        format.json { render :index, status: :ok, location: @bar_graph }
      else
        format.html { render :edit }
        format.json { render json: @bar_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bar_graphs/1
  # DELETE /bar_graphs/1.json
  def destroy
    @bar_graph.destroy
    respond_to do |format|
      format.html { redirect_to bar_graphs_url, notice: 'Bar graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar_graph
      @bar_graph = BarGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_graph_params
      params.require(:bar_graph).permit(:score, :total)
    end
end
