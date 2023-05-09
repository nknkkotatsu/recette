class Worker::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build ##親モデル.子モデル.buildで子モデルのインスタンス作成
    @procedures = @recipe.procedures.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save!
      redirect_to worker_worker_recipes_path, notice: "ルセットを投稿しました！"
    else
      render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def index
    @recipes = Recipe.all.page(params[:page]).per(8)
  end

  def show
  end

  def edit
  end
end
private

  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :image,:worker_id,
      procedures_attributes: [:procedure, :_destroy],
      ingredients_attributes: [:name, :quantity, :_destroy]
    )
  end
