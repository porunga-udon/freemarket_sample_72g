require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  let(:user){create(:user)}
  let(:category){create(:category)}
  describe 'GET #edit' do
    it "@goodに正しい値が入っていること" do
      good = create(:good, seller_id: user.id, category_id: category.id)
      get :edit, params: { id: good}
      expect(assigns(:good)).to eq good
    end

    it "edit.html.erbに遷移すること" do
      good = create(:good, seller_id: user.id, category_id: category.id)
      get :edit, params: { id: good}
      expect(response).to render_template :edit
    end
  end


end
