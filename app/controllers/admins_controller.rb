class AdminsController < ApplicationController
  before_action :signed_in_user
  layout "admin"

  def dashboard
    @events = Event.all.order('created_at desc').limit(10)
    @tests = Testimoni.all.order('created_at desc').limit(6)
    @sliders = Slider.all.order('created_at desc')
    @news = News.all.order('created_at desc').limit(6)
  end
end
