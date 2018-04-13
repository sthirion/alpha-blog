class ArticlesController < ApplicationController
  before_action :article_find, only: [:edit, :update, :show, :destroy]
  
  def new
    @article = Article.new()
    
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def index
    @articles = Article.all()
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    else
      render 'index'
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def article_find
    @article = Article.find(params[:id])
  end
  
  
end