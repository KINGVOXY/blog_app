class User < ApplicationRecord
    before_save { email.downcase! } # user.saveをする前にemailを小文字に変換する
    validates :name,  presence: true, length: { maximum: 50 } # name最大文字数
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # email正規表現
    validates :email, presence: true, length: { maximum: 255 }, # email最大文字数
    format: { with: VALID_EMAIL_REGEX }, # emailフォーマット設定
    uniqueness: { case_sensitive: false } # emailの一意性をなくす
    has_secure_password # 不可逆passwordを設定し認証するメソッドを追加
    validates :password, presence: true, length: { minimum: 6 } # パスワード最小文字数
end
