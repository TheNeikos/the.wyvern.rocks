require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  context "for no users" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "for a non-logged-in user" do
    let(:user) { create(:user) }

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "creates and redirects to new user" do
        user2 = build(:user)
        post :create, params: { user: {
          name: user2.name,
          email: user2.email,
          password: user2.password,
          password_confirmation: user2.password
        } }
        user2 = User.find_by_email(user2.email)
        expect(response).to redirect_to user_path(user2)
        expect(user2).to_not be_nil
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET edit" do
      it "redirects to new session" do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to new_session_path
      end
    end

    describe "POST update" do
      it "redirects to new session" do
        post :update, params: { id: user.id }
        expect(response).to redirect_to new_session_path
      end
    end

    describe "POST destroy" do
      it "redirects to new session" do
        post :destroy, params: { id: user.id }
        expect(response).to redirect_to new_session_path
      end
    end
  end

  context "for a logged_in user" do
    let(:user) { create :user, :has_active_session }

    before :each do
      session[:user_id] = user.id
      session[:sess_id] = user.sessions.first.id
    end

    describe "GET new" do
      it "redirect to current_user" do
        get :new
        expect(response).to redirect_to user_path(user)
      end
    end

    describe "POST create" do
      it "redirect to current_user" do
        post :create
        expect(response).to redirect_to user_path(user)
      end
    end

    describe "GET show" do
      it "redirect to current_user" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST update" do
      it "returns http success" do
        post :update, params: { id: user.id, user: { name: "Changed!" } }
        expect(response).to redirect_to user_path(user)
        expect(user.reload.name).to eq "Changed!"
      end
    end

    describe "POST destroy" do
      it "returns auth error" do
        expect{post :destroy, params: { id: user.id }}.to  raise_error Pundit::NotAuthorizedError
      end
    end
  end

end
