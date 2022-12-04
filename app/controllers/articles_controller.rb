class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @message = "test message"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render "new"
    end
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
      params.require(:article).permit(:title, :content).merge(auther: current_user.id)
    end
  
end
