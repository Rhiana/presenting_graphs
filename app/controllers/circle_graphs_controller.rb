class CircleGraphsController < ApplicationController
  before_action :set_circle_graph, only: [:show, :edit, :update, :destroy]

  # GET /circle_graphs
  # GET /circle_graphs.json
  def index
    @circle_graphs = CircleGraph.all
  end

  # GET /circle_graphs/1
  # GET /circle_graphs/1.json
  def show
    redirect_to circle_graphs_url
  end

  # GET /circle_graphs/new
  def new
    @circle_graph = CircleGraph.new
  end

  # GET /circle_graphs/1/edit
  def edit
  end

  # POST /circle_graphs
  # POST /circle_graphs.json
  def create
    @circle_graph = CircleGraph.new(circle_graph_params)

    respond_to do |format|
      if @circle_graph.save
        format.html { redirect_to edit_circle_graph_path(@circle_graph), notice: "Circle graph was successfully created." }
        format.json { render :edit, status: :created, location: @circle_graph }
      else
        format.html { render :new }
        format.json { render json: @circle_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circle_graphs/1
  # PATCH/PUT /circle_graphs/1.json
  def update
    respond_to do |format|
      if @circle_graph.update(circle_graph_params)
        format.html { redirect_to edit_circle_graph_path(@circle_graph), notice: "Circle graph was successfully updated." }
        format.json { render :edit, status: :ok, location: @circle_graph }
      else
        format.html { render :edit }
        format.json { render json: @circle_graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circle_graphs/1
  # DELETE /circle_graphs/1.json
  def destroy
    @circle_graph.destroy
    respond_to do |format|
      format.html { redirect_to circle_graphs_url, notice: "Circle graph was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle_graph
      @circle_graph = CircleGraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_graph_params
      params.require(:circle_graph).permit(:score, :total)
    end
end
