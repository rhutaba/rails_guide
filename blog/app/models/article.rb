class Article < ApplicationRecord
  # articles と comments テーブルの関係定義
  # article が削除された場合に、作成されたブログのcomment が削除される
  has_many :comments, dependent: :destroy

  # タイトルは1文字以上ないとエラー
  validates :title, presence: true, length: { minimum: 1 }
end
