class Worker::SessionsController < Devise::SessionsController
  def guest_sign_in
    worker = Worker.guest
    sign_in worker
    redirect_to root_path, notice: 'guestuserでログインしました。'
  end
end