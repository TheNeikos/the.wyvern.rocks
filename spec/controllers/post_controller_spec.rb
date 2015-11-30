require 'rails_helper'

RSpec.describe PostController, :type => :controller do

  context "for no logged in user" do
    let (:topic) { create :topic }
    let (:topic_post) { create :post }
    describe "GET new" do
      it "returns no http success when restricted" do
        expect{
          get :new, params: { topic_id: topic.id }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "GET create" do
      it "returns no http success" do
        expect{
          post :create, params: { topic_id: topic.id, post: {content: "what"} }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "GET edit" do
      it "returns no http success" do
        expect{
          get :edit, params: { id: topic_post.id }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "GET update" do
      it "returns no http success" do
        expect{
          post :update, params: { id: topic_post.id, post: {content: "wh"} }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "GET destroy" do
      it "returns no http success" do
        expect{
          post :destroy, params: { id: topic_post.id }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe "GET show" do
      it "redirects to topic" do
        get :show, params: { id: topic_post.id }
        expect(response).to redirect_to(topic_path(topic_post.topic, anchor: topic_post.anchor))
      end
    end
  end

  context "for a logged in user" do
    let (:user) { create :user, :has_active_session }
    let (:topic) { create :topic }
    let (:topic_post) { create :post, user: user }

    before :each do
      session[:user_id] = user.id
      session[:sess_id] = user.sessions.first.id
    end

    describe "GET new" do
      it "returns http success" do
        get :new, params: { topic_id: topic.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "returns http success" do
        post :create, params: { topic_id: topic.id, post: {content: "what"} }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { id: topic_post.id }
        expect(response).to be_success
      end
    end

    describe "post update" do
      it "returns http success" do
        post :update, params: { id: topic_post.id, post: {content: "wh"} }
        expect(response).to redirect_to(topic_path(topic_post.topic, anchor: topic_post.anchor))
        expect(Post.find(topic_post.id).content).to eq "wh"
      end
    end

    describe "POST destroy" do
      it "returns no http success" do
        post :destroy, params: { id: topic_post.id }
        expect(response).to be_success
      end
    end

    describe "GET show" do
      it "returns no http success" do
        get :show, params: { id: topic_post.id }
        expect(response).to redirect_to(topic_path(topic_post.topic, anchor: topic_post.anchor))
      end
    end
  end

end
