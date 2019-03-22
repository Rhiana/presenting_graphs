class GaugeGraphsController < ApplicationController
  before_action :set_gauge_graph, only: [:show, :edit, :update, :destroy]

  # GET /gauge_graphs
  # GET /gauge_graphs.json
  def index
    @gauge_graphs = GaugeGraph.all
  end

  # GET /gauge_graphs/1
  # GET /gauge_graphs/1.json
  def show
  end

  # GET /gauge_graphs/new
  def new
    @gauge_graph = GaugeGraph.new
  end

  # GET /gauge_graphs/1/edit
  def edit
  end

  # POST /gauge_graphs
  # POST /gauge_graphs.json
  def create
    @gauge_graph = GaugeGraph.new(gauge_graph_params)

    respond_to do |format|
      if @gauge_graph.save
        format.html { redirect_to edit_gauge_graph_path(@gauge_graph), notice: 'Gauge graph was successfully created.' }
        format.json { render :edit, status: :created, location: @gauge_graph }
      else
        format.html { render :new }
        format.json { render json: @gauge_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gauge_graphs/1
  # PATCH/PUT /gauge_graphs/1.json
  def update
    respond_to do |format|
      if @gauge_graph.update(gauge_graph_params)
        format.html { redirect_to edit_gauge_graph_path(@gauge_graph), notice: 'Gauge graph was successfully updated.' }
        format.json { render :edit, status: :ok, location: @gauge_graph }
      else
        format.html { render :edit }
        format.json { render json: @gauge_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gauge_graphs/1
  # DELETE /gauge_graphs/1.json
  def destroy
    @gauge_graph.destroy
    respond_to do |format|
      format.html { redirect_to gauge_graphs_url, notice: 'Gauge graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gauge_graph
      @gauge_graph = GaugeGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gauge_graph_params
      params.require(:gauge_graph).permit(:score, :total)
    end
end
