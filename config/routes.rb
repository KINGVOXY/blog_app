Rails.application.routes.draw do

  root 'home#top' # topページ
  get '/about' => 'home#about' # 自己紹介

  get '/blogs' => 'blogs#index' # 投稿一覧
  get '/blogs/:id/status' => 'blogs#status' # 投稿詳細表示

  get '/blogs/new' => 'blogs#new' # 記事投稿
  post '/blogs/complete' => 'blogs#create' # 投稿完了処理

  get '/blogs/:id/edit' => 'blogs#edit' # 記事編集
  put '/blogs/:id/update' => 'blogs#update' # 記事更新

  delete '/blogs/:id/destroy' => 'blogs#destroy' # 記事削除

  get    '/login' => 'sessions#new' # ログインページ
  post   '/login' => 'sessions#create' # ログイン処理
  delete '/logout' => 'sessions#destroy' # ログアウト処理

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
