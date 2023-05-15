class Worker::PointsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    point = current_worker.points.new(point_params)
    point.recipe_id = recipe.id
    point.save
    redirect_to worker_recipe_path(recipe)
  end

  private

  def point_params
    params.require(:point).permit(:point)
  end
end
