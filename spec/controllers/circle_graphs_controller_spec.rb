require 'rails_helper'

RSpec.describe CircleGraphsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # CircleGraph. As you add validations to CircleGraph, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CircleGraphsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      circle_graph = CircleGraph.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "redirects to the index page" do
      circle_graph = CircleGraph.create! valid_attributes
      get :show, params: {id: circle_graph.to_param}, session: valid_session
      expect(response).to redirect_to(circle_graphs_url)
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
      circle_graph = CircleGraph.create! valid_attributes
      get :edit, params: {id: circle_graph.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CircleGraph" do
        expect {
          post :create, params: {circle_graph: valid_attributes}, session: valid_session
        }.to change(CircleGraph, :count).by(1)
      end

      it "redirects to the created circle_graph" do
        post :create, params: {circle_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(CircleGraph.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {circle_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested circle_graph" do
        circle_graph = CircleGraph.create! valid_attributes
        put :update, params: {id: circle_graph.to_param, circle_graph: new_attributes}, session: valid_session
        circle_graph.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the circle_graph" do
        circle_graph = CircleGraph.create! valid_attributes
        put :update, params: {id: circle_graph.to_param, circle_graph: valid_attributes}, session: valid_session
        expect(response).to redirect_to(circle_graph)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        circle_graph = CircleGraph.create! valid_attributes
        put :update, params: {id: circle_graph.to_param, circle_graph: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested circle_graph" do
      circle_graph = CircleGraph.create! valid_attributes
      expect {
        delete :destroy, params: {id: circle_graph.to_param}, session: valid_session
      }.to change(CircleGraph, :count).by(-1)
    end

    it "redirects to the circle_graphs list" do
      circle_graph = CircleGraph.create! valid_attributes
      delete :destroy, params: {id: circle_graph.to_param}, session: valid_session
      expect(response).to redirect_to(circle_graphs_url)
    end
  end

end
