class ArticlesController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:success] = "Successfully created article"
      redirect_to articles_path
    else
      render 'new'
    end    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      flash[:success] = "Succesfully updated article!"
      redirect_to @article
    else
      render 'edit'
    end    
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    flash[:success] = "Successfully deleted article"
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :banner_photo)
    end

end
