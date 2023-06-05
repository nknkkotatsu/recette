class Worker::IdeasController < ApplicationController
  before_action :ensure_worker, only: [:edit, :update, :destroy]
  
  def new
    @idea = Idea.new
    @worker = current_worker
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.worker_id = current_worker.id
    #binding.pry
    if @idea.save!
      redirect_to worker_idea_path(@idea.id)
    else
      render :new
    end
  end

  def index
    @ideas = Idea.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @worker = current_worker
  end

  def edit
    @idea = Idea.find(params[:id])
    @worker = current_worker
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to worker_idea_path(@idea.id)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to worker_ideas_path
  end


  private


  def idea_params
    params.require(:idea).permit(:image, :name, :ingredient, :allergen, :explanation, :remarks, :genre_id, :price )
  end
  
  def ensure_worker
    @idea = current_worker.ideas.find_by(id: params[:id])
  redirect_to worker_ideas_path unless @idea
  end
end
