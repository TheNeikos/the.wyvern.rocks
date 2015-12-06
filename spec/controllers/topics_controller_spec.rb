require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do

  context "for a guest" do
    let (:topic) { create :topic }
    let (:topic_b) { build :topic }
    describe "GET new" do
      it "returns http success" do
        expect{
          get :new, params: { category_id: topic.category.id }
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end

    describe "POST create" do
      it "returns http success" do
        expect{
          post :create, params: {
            category_id: topic.category.id,
            topic: { name: topic_b.name }
          }
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        expect{
          get :edit, params: { id: topic.id }
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end

    describe "POST update" do
      it "returns http success" do
        expect{
          post :update, params: { id: topic.id }
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end

    describe "POST destroy" do
      it "returns http success" do
        expect{
          post :destroy, params: { id: topic.id }
        }.to raise_exception(Pundit::NotAuthorizedError)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: topic.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
  context "for a privileged user" do
    let (:user) { create :user, :has_active_session, :restricted }
    let (:topic) { create :topic, :restricted, user: user }
    let (:topic_b) { build :topic }

    before :each do
      session[:user_id] = topic.user.id
      session[:sess_id] = topic.user.sessions.first.id
    end
    describe "GET new" do
      it "returns http success" do
        get :new, params: { category_id: topic.category.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "returns http success" do
        post :create, params: {
          category_id: topic.category.id,
          topic: { name: topic_b.name, posts_attributes: [content: "what"] }
        }
        expect(Topic.find_by_name(topic_b.name)).to_not eq nil
        expect(Topic.find_by_name(topic_b.name).posts.count).to eq 1
        expect(response).to redirect_to(Topic.find_by_name(topic_b.name))
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { id: topic.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST update" do
      it "returns http success" do
        post :update, params: {
          id: topic.id,
          topic: { name: "new topic name" },
          test: { a: "adsasd" }
        }
        expect(response).to redirect_to(topic)
        expect(topic.reload.name).to eq("new topic name")
      end
    end

    describe "POST destroy" do
      it "returns http success" do
        post :destroy, params: { id: topic.id }
        expect(response).to redirect_to(topic.category)
        expect(Topic.find_by_id(topic.id)).to eq nil
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { id: topic.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
