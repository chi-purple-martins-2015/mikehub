class PagesController < ApplicationController
  def index
    @featured_articles = Article.limit(8)
    @recently_added_articles = Article.order(created_at: :desc).limit(5)
  end

  def search
    @query = params[:search_term]
    @title_matches = Article.where('title LIKE ?', '%' + @query + '%')
    @subtitle_matches = Article.where('subtitle LIKE ?', '%' + @query + '%')
    @content_matches = Article.where('content LIKE ?', '%' + @query + '%')
  end
end
