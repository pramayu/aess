class SlidersController < ApplicationController


  
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_slider, only: [:edit, :update, :destroy]

  def new
    @slider = Slider.new
    render layout: "admin"
  end

  def create
    @slider = Slider.new(params_slider)
    if @slider.save
      redirect_to all_slider_path
    else
      render 'new'
    end
  end

  def edit
    render layout: "admin"
  end

  def update
    if @slider.update(params_slider)
      redirect_to all_slider_path
    else
      render 'edit'
    end
  end

  def destroy
    @slider.destroy
    redirect_to all_slider_url
  end

  def all_slider
    @sliders = Slider.all.order('created_at desc')
    render layout: "admin"
  end

  private

  def params_slider
    params.require(:slider).permit(:slider, :name)
  end

  def set_slider
    @slider = Slider.find(params[:id])
  end

end
