# frozen_string_literal: true

class Categories::ArticlesController < ApplicationController
  def index
    @articles = Category::Article.all
  end

  def show
    @article = Category::Article.find(params[:id])
  end

  def new
    @article = Category::Article.new
  end

  def create
    @article = Category::Article.new(category_article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Category::Article.find(params[:id])
  end

  def update
    @article = Category::Article.find(params[:id])

    if @article.update(category_article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Category::Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def category_article_params
    params.require(:category_article).permit(:title, :body, :category_article_id)
  end
end
