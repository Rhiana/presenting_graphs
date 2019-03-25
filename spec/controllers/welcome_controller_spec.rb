require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      expect(response).to be_success
    end
  end

end
