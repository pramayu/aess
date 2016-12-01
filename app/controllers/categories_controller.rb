class CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy, :all_category]

  def new
    @category = Category.new
    render layout: "admin"
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
    render layout: "admin"
  end

  def all_category
    @tests = Category.all.order('created_at desc')
    render layout: "admin"
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
