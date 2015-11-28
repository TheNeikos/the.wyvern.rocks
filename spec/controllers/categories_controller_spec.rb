require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  context "for no logged in user" do
    let :category do
      create :category
    end

    let :restricted_category do
      create :category, :restricted
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: category.id }
        expect(response).to have_http_status(:success)
      end

      it "returns no http success when restricted" do
        expect{
          get :show, params: { id: restricted_category.id }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

end
