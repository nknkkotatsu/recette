class Worker::IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to worker_ideas_show_path(@idea.id)
    else
      render :new
    end
  end

  def index
    @ideas = Idea.all.page(params[:page]).per(10)
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end
  
  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to worker_ideas_show_path(@idea.id)
    else
      render :edit
    end
  end


  private


  def idea_params
    params.require(:idea).permit(:image, :name, :ingredient, :allergen, :explanation, :remarks, :genre_id, :price )
  end
end
