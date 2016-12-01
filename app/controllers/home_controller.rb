class HomeController < ApplicationController
  def index
    @news = News.all.order('created_at desc')
  end

  def event
    @categories = Category.all.order('name asc')
  end

  def contact
    @contact = Contact.new
  end

  def about
    
  end

  def testimonials
    @testimonis = Testimoni.all.order('created_at desc')
  end

  def gallery
    @category = Category.find_by_slug!(params[:id])
  end

end
