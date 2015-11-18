require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  context "for no logged in user" do
    let (:user) { create :user }
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "post create" do
      it "returns http success" do
        post :create, params: {
          user: { email: user.email, password: user.password }
        }
        expect(response).to redirect_to(root_path)
        expect(session[:sess_id]).to_not be_nil
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST destroy" do
      it "returns http success" do
        post :destroy
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "for a logged in user" do
    let(:user) { create :user, :has_active_session }

    before :each do
      session[:user_id] = user.id
      session[:sess_id] = user.sessions.first.id
    end

    describe "GET new" do
      it "redirects to show" do
        get :new
        expect(response).to redirect_to(session_path)
      end
    end

    describe "post create" do
      it "redirects to show" do
        post :create, params: { user: {name: "asdf"} }
        expect(response).to redirect_to(session_path)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST destroy" do
      it "returns http success" do
        post :destroy
        expect(response).to redirect_to(new_session_path)
        expect(session[:sess_id]).to be_nil
      end
    end

    describe "POST destroy for specific session" do
      it "returns http success" do
        sess = user.sessions.create ip: "localtest"
        post :destroy, params: { sess_id: sess.id }
        expect(response).to redirect_to(session_path)
        expect(user.sessions.find_by_id(sess.id)).to be_nil
      end
    end
  end

end
