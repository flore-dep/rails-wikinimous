class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to articles_index_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to articles_index_path
  end

  def destroy
    @article.destroy
    redirect_to articles_index_path status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
