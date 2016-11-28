class HomeController < ApplicationController
  def index
    @news = News.all.order('created_at desc')
  end
end
