class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
  end
end
