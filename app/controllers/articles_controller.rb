class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("#{sort_column} #{sort_direction}")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
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

  def destroy
    @article = Article.find(params[:id])
    ActiveRecord::Base.transaction do
      now = Time.now
      @article.update_column(:deleted_at, now)
    end
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :content).merge(employee_id: current_user.id)
    end

    def sort_column
      params[:sort] ? params[:sort] : 'created_at'
    end
  
    def sort_direction
      params[:direction] ? params[:direction] : 'desc'
    end
  
end
