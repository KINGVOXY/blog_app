Rails.application.routes.draw do

  root 'home#top' # topページ
  get '/about' => 'home#about' # 自己紹介

  "
  get '/blogs' => 'blogs#index' # 投稿一覧
  get '/blogs/new' => 'blogs#new' # 記事投稿
  post '/blogs/complete' => 'blogs#create' # 投稿完了処理

  delete '/blog/:id/destroy' => 'blogs#destroy' # 記事削除

  get    '/login' => 'sessions#new' # ログインページ
  post   '/login' => 'sessions#create' # ログイン処理
  delete '/logout' => 'sessions#destroy' # ログアウト処理

  resources :users
  "

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
