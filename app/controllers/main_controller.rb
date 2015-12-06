class MainController < ApplicationController
  def index
    @categories = policy_scope(Category.all)
  end
end
