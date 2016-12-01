class NewsController < ApplicationController
  
  before_action :set_news, only: [:update, :edit, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @news = News.new
  end

  def create
    @news = News.new(params_news)
    if @news.save
      redirect_to new_news_url
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @news.update(params_news)
      redirect_to new_news_url
    else
      render 'edit'
    end
  end

  def destroy
    @news.destroy
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def params_news
    params.require(:news).permit(:title, :content)
  end

end
