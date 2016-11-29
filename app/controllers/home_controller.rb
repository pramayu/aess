class HomeController < ApplicationController
  def index
    @news = News.all.order('created_at desc')
  end

  def event
    @categories = Category.all.order('name asc')
  end

  def contact

  end

  def about
    
  end

  def testimonials
    @testimonis = Testimoni.all.order('created_at desc')
  end

end
