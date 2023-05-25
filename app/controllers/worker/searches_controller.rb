class Worker::SearchesController < ApplicationController
    before_action :authenticate_worker!

  def search
    @range = params[:range]
    @recipe = []
    @idea = []

    if params[:search].present?
      search_mode = params[:search]
    else
      search_mode = "partial_match"
    end

    if @range == "Recipe"
      @recipe = Recipe.looks(search_mode, params[:word])
    else
      @idea = Idea.looks(search_mode, params[:word])
    end
  end
end
