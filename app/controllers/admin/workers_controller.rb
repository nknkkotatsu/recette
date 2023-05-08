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


  private


  def customer_params
    params.require(:worker).permit(:name, :email, :is_deleted)
  end
end
