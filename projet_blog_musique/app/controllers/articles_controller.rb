class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update title: params[:title], content: params[:content]
      redirect_to "/articles/#{params[:id]}"
    else
      render "show"
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to "/articles"
  end

end
