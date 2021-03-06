class TestimonisController < ApplicationController

  before_action :set_test, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @testimoni = Testimoni.new
    render layout: "admin"
  end


  def create
    @testimoni = Testimoni.new(params_test)
    if @testimoni.save
      redirect_to new_testimoni_path
    else 
      render 'new'
    end
  end

  def edit
    render layout: "admin"
  end

  def update
    if @testimoni.update(params_test)
      redirect_to new_testimoni_path
    else
      render 'edit'
    end
  end

  def all_testimoni
    @tests = Testimoni.all.order('created_at desc')
    render layout: "admin"
  end

  def destroy
    @testimoni.destroy
    redirect_to all_testimoni_url
  end

  private

  def params_test
    params.require(:testimoni).permit(:name, :content, :avatar, :occupation)
  end

  def set_test
    @testimoni = Testimoni.find(params[:id])
  end
end
