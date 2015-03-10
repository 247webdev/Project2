require 'rails_helper'

RSpec.describe AccessController, type: :controller do

  describe "GET #landingpage" do
    it "returns http success" do
      get :landingpage
      expect(response).to have_http_status(:success)
    end
  end

end
