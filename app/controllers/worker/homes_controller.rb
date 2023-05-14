class Worker::HomesController < ApplicationController
   before_action :is_matching_login_worker
  def top
  end
  
  private
  
  private
  def is_matching_login_worker
    unless worker_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/workers/sign_in'
    end
  end
end