class BlogsController < ApplicationController

  before_action :logged_in_user, except: :index # 未ログイン時はindexを除いてアクセスできない

  def index
    @articles = Article.all.order("id DESC") # 記事取得
  end
    
  def new
    @article = Article.new # 新しいArticleを生成する
  end

  def create
    Article.create(blog_params) # blog_paramの内容でArticleを生成
    redirect_to '/blogs' # ブログ画面にリダイレクト
  end

  def edit
    @article = Article.find_by(id: params[:id]) # 同じidの記事を探して代入
  end

  def update
    @article = Article.find_by(id: params[:id]) # 同じidの記事を探して代入
    @article.update_attribute(:title, params[:title])
    @article.update_attribute(:image, params[:image])
    @article.update_attribute(:content, params[:content])
    redirect_to '/blogs'
  end

  def destroy
    @article = Article.find_by(id: params[:id]) # 同じidの記事を探して代入
    @article.destroy # 代入したオブジェクトを消す
    redirect_to '/blogs' # ブログ画面にリダイレクト
  end

  private
  def blog_params
    params.permit(:title, :image, :content) # 記事の設定
  end

  private
  def logged_in_user
    redirect_to '/login' unless logged_in? # loginしていなかったらloginへ
  end

end
