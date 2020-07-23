module SessionsHelper
    # 渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id # 指定のユーザidでセッションを有効にする
    end

    def log_out
        session.delete(:user_id) # 指定のidのユーザをセッションから切る
        @current_user = nil # 今のユーザを空に
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id]) # 今のユーザを取得
        end
    end
    def logged_in?
        !current_user.nil? # 今userオブジェクトが有効かどうか
    end
end
