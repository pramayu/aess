class HomeController < ApplicationController
  def index
    @news = News.all.order('created_at desc')
  end

  def event
    @categories = Category.all.order('name asc')
  end
end
