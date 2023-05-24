class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    worker = Worker.find(params[:id])
    if worker.update(worker_params)
       redirect_to admin_workers_path
    else
       redirect_to admin_workers_path(worker.id)
    end
  end

  def check
    @worker = Worker.find(params[:id])
    #ユーザーの情報を見つける
  end

  def hide
    @worker = Worker.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
      @worker.update(is_deleted: true)
      #ログアウトさせる
      redirect_to admin_workers_path
  end


  private


  def customer_params
    params.require(:worker).permit(:name, :email, :is_deleted)
  end
  def user_params
    params.require(:worker).permit(:active)
  end
end
