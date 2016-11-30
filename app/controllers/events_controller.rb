class EventsController < ApplicationController


  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def new
    @event = current_user.events.build
    @categories = Category.all.order("name")
    @event.galleries.build
    # render layout: "admin"
  end

  def create
    @event = current_user.events.build(params_event)
    if @event.save
      redirect_to new_event_url
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.order("name")
    # render layout: "admin"
  end

  def update
    if @event.update(params_event)
      redirect_to new_event_url
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to new_event_path
  end

  private

  def set_event
    # @event = Event.friendly.find(params[:id])
    @event = Event.find(params[:id])
  end

  def params_event
    params.require(:event).permit(:name, :event_date, :category_id, galleries_attributes: [:image, :name, :category_id, :description, :_destroy])
  end

end
