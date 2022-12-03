class ArticleController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @employee = @current_user
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  end

  def delete
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :content).merge(auther: @employee.id)
    end
end
