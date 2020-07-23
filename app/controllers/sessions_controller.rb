class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) # ユーザーログイン後にブログ編集ができる
      log_in user
      redirect_to "/blog"
    else
      flash[:danger] = 'メールアドレス、パスワードのどちらかまたは両方の入力に誤りがあります。' # エラーメッセージ
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to "/blog"
  end
end
