class GalleriesController < ApplicationController

  def delt
    @event = Event.find(params[:event_id])
    @gallery = Gallery.find(params[:id])
    @event.galleries.destroy(@gallery)
    redirect_to event_url(@event)  
  end

end
