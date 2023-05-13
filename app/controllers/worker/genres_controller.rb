class Worker::GenresController < ApplicationController
  before_action :authenticate_worker!
  def index
   @genre = Genre.new
   @genres = Genre.all
  end

  def create
   genre = Genre.new(genre_params)
    if genre.save
      redirect_to worker_genres_path, notice: "ジャンルを作成しました。"
    else
      @genre = genre
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
    redirect_to worker_genres_path
    else
    redirect_to edit_worker_genre_path
    end
  end


private

def genre_params
  params.require(:genre).permit(:name)
end

end
