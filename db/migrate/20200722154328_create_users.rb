class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name # 名前
      t.string :email # メールアドレス

      t.timestamps # ユーザーが作成or更新されたとき、時刻を自動的に記録
    end
  end
end
