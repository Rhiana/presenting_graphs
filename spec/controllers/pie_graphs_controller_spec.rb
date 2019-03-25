require 'rails_helper'

RSpec.describe PieGraphsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PieGraph. As you add validations to PieGraph, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PieGraphsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      pie_graph = PieGraph.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "redirects to the index page" do
      pie_graph = PieGraph.create! valid_attributes
      get :show, params: {id: pie_graph.to_param}, session: valid_session
      expect(response).to redirect_to(pie_graphs_url)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      pie_graph = PieGraph.create! valid_attributes
      get :edit, params: {id: pie_graph.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PieGraph" do
        expect {
          post :create, params: {pie_graph: valid_attributes}, session: valid_session
        }.to change(PieGraph, :count).by(1)
      end

      it "redirects to the created pie_graph" do
        post :create, params: {pie_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(PieGraph.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {pie_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pie_graph" do
        pie_graph = PieGraph.create! valid_attributes
        put :update, params: {id: pie_graph.to_param, pie_graph: new_attributes}, session: valid_session
        pie_graph.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the pie_graph" do
        pie_graph = PieGraph.create! valid_attributes
        put :update, params: {id: pie_graph.to_param, pie_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(pie_graph)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        pie_graph = PieGraph.create! valid_attributes
        put :update, params: {id: pie_graph.to_param, pie_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pie_graph" do
      pie_graph = PieGraph.create! valid_attributes
      expect {
        delete :destroy, params: {id: pie_graph.to_param}, session: valid_session
      }.to change(PieGraph, :count).by(-1)
    end

    it "redirects to the pie_graphs list" do
      pie_graph = PieGraph.create! valid_attributes
      delete :destroy, params: {id: pie_graph.to_param}, session: valid_session
      expect(response).to redirect_to(pie_graphs_url)
    end
  end

end
