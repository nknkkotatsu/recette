class Worker::CommentsController < ApplicationController
  def create
    idea = Idea.find(params[:idea_id])
    comment = current_worker.comments.new(comment_params)
    comment.idea_id = idea.id
    comment.save
    redirect_to worker_idea_path(idea)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
