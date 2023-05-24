class Worker::SessionsController < Devise::SessionsController
  before_action :worker_state, only: [:create]

  def guest_sign_in
    worker = Worker.guest
    sign_in worker
    redirect_to root_path, notice: 'guestuserでログインしました。'
  end
    protected
# 退会しているかを判断するメソッド
def worker_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @worker = Worker.find_by(email: params[:worker][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@worker
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @worker.is_deleted
    return
  end
  if @worker.valid_password?(params[:worker][:password])
    ## 【処理内容3】
    redirect_to root_path
  end
end
end