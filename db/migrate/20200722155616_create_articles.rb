class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title # 記事タイトル
      t.string :image # 埋め込み画像URL
      t.string :content # 記事内容

      t.timestamps # 記事が作成or更新されたとき、時刻を自動的に記録
    end
  end
end
