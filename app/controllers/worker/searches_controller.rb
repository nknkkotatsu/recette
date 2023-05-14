class Worker::SearchesController < ApplicationController
    before_action :authenticate_worker!

  def search
    @range = params[:range]
    @recipe = []
    @idea = []
    if @range == "Recipe"
      @recipe = Recipe.looks(params[:search], params[:word])
    else
      @idea = Idea.looks(params[:search], params[:word])
    end
  end
end
