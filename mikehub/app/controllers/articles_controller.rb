class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.create(article_params)
    if @article.valid?
      redirect_to root_path
    else
      @errors = @article.errors.full_messages
      render "/articles/new"
    end
  end

  def edit
  end

  def update 
    @article = Article.find(params[:id])
    p @article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :body)
  end

end

