class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にブログ編集ができる
      log_in(user) # ログイン判定
      redirect_to "/blogs" # リダイレクト
    else
      flash[:danger] = 'メールアドレス、パスワードのどちらかまたは両方の入力に誤りがあります。' # エラーメッセージ
      render '/sessions/new' # loginページ再読み込み
    end
  end

  def destroy
    log_out # logout処理
    redirect_to "/blogs" # 記事一覧へ
  end
end
