class PieGraphsController < ApplicationController
  before_action :set_pie_graph, only: [:show, :edit, :update, :destroy]

  # GET /pie_graphs
  # GET /pie_graphs.json
  def index
    @pie_graphs = PieGraph.all
  end

  # GET /pie_graphs/1
  # GET /pie_graphs/1.json
  def show
  end

  # GET /pie_graphs/new
  def new
    @pie_graph = PieGraph.new
  end

  # GET /pie_graphs/1/edit
  def edit
  end

  # POST /pie_graphs
  # POST /pie_graphs.json
  def create
    @pie_graph = PieGraph.new(pie_graph_params)

    respond_to do |format|
      if @pie_graph.save
        format.html { redirect_to pie_graphs_url, notice: 'Pie graph was successfully created.' }
        format.json { render :index, status: :created, location: @pie_graph }
      else
        format.html { render :new }
        format.json { render json: @pie_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pie_graphs/1
  # PATCH/PUT /pie_graphs/1.json
  def update
    respond_to do |format|
      if @pie_graph.update(pie_graph_params)
        format.html { redirect_to pie_graphs_url, notice: 'Pie graph was successfully updated.' }
        format.json { render :index, status: :ok, location: @pie_graph }
      else
        format.html { render :edit }
        format.json { render json: @pie_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pie_graphs/1
  # DELETE /pie_graphs/1.json
  def destroy
    @pie_graph.destroy
    respond_to do |format|
      format.html { redirect_to pie_graphs_url, notice: 'Pie graph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pie_graph
      @pie_graph = PieGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pie_graph_params
      params.require(:pie_graph).permit(:score1, :score2, :score3)
    end
end
