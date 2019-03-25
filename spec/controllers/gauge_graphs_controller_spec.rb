require 'rails_helper'

RSpec.describe GaugeGraphsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GaugeGraph. As you add validations to GaugeGraph, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GaugeGraphsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      gauge_graph = GaugeGraph.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "redirects to the index page" do
      gauge_graph = GaugeGraph.create! valid_attributes
      get :show, params: {id: gauge_graph.to_param}, session: valid_session
      expect(response).to redirect_to(gauge_graphs_url)
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
      gauge_graph = GaugeGraph.create! valid_attributes
      get :edit, params: {id: gauge_graph.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GaugeGraph" do
        expect {
          post :create, params: {gauge_graph: valid_attributes}, session: valid_session
        }.to change(GaugeGraph, :count).by(1)
      end

      it "redirects to the created gauge_graph" do
        post :create, params: {gauge_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(GaugeGraph.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {gauge_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gauge_graph" do
        gauge_graph = GaugeGraph.create! valid_attributes
        put :update, params: {id: gauge_graph.to_param, gauge_graph: new_attributes}, session: valid_session
        gauge_graph.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the gauge_graph" do
        gauge_graph = GaugeGraph.create! valid_attributes
        put :update, params: {id: gauge_graph.to_param, gauge_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(gauge_graph)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        gauge_graph = GaugeGraph.create! valid_attributes
        put :update, params: {id: gauge_graph.to_param, gauge_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gauge_graph" do
      gauge_graph = GaugeGraph.create! valid_attributes
      expect {
        delete :destroy, params: {id: gauge_graph.to_param}, session: valid_session
      }.to change(GaugeGraph, :count).by(-1)
    end

    it "redirects to the gauge_graphs list" do
      gauge_graph = GaugeGraph.create! valid_attributes
      delete :destroy, params: {id: gauge_graph.to_param}, session: valid_session
      expect(response).to redirect_to(gauge_graphs_url)
    end
  end

end
