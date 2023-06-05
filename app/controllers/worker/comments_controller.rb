class Worker::CommentsController < ApplicationController
  before_action :ensure_worker, only: [:destroy]
  
  def create
    idea = Idea.find(params[:idea_id])
    comment = current_worker.comments.new(comment_params)
    comment.idea_id = idea.id
    comment.save
    redirect_to worker_idea_path(idea)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: worker_ideas_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
  
  def ensure_worker
    @comment = current_worker.comments.find_by(id: params[:id])
    redirect_to worker_ideas_path unless @comment
  end
end
