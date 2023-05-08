class Worker::SessionsController < Devise::SessionsController
  def guest_sign_in
    worker = Worker.guest
    sign_in worker
    redirect_to worker_path(worker), notice: 'guestuserでログインしました。'
  end
end