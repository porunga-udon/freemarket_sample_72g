require 'rails_helper'

describe GoodsController do
  describe 'GET #edit' do
    it "@goodに正しい値が入っていること" do
      good = create(:good)
      get :edit, params: { id: good }
      expect(assigns(:good)).to eq good
    end

    it "edit.html.erbに遷移すること" do
      good = create(:good)
      get :edit, params: { id: good }
      expect(response).to render_template :edit
    end
  end


end
