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
  
  def withdrawl
      @worker = Worker.find(current_worker.id)
      #現在ログインしているユーザーを@userに格納
      @worker.update(is_active: "Invalid")
      #updateで登録情報をInvalidに変更
      reset_session
      #sessionIDのresetを行う
      redirect_to root_path
      #指定されたrootへのpath
  end


  private


  def customer_params
    params.require(:worker).permit(:name, :email, :is_deleted)
  end
  def user_params
    params.require(:worker).permit(:active)
  end
end
