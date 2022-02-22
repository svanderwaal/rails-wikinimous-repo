class ArticlesController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # if @task.save
    #   redirect_to task_path(@task.id)
    # else
    #   render :new
    # end
    redirect_to articles_path
  end

  def edit
  end

  def update
    # PATCH
    # update with new data
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_task
    @article = Article.find(params[:id])
  end

  def task_params
    params.require(:article).permit(:title, :content)
  end
end
