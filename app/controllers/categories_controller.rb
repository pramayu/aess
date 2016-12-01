class CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_url
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @category.update(category_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
