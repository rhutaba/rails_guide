class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body

      # 以下の行によって'article_id'という整数カラムが追加される
      # Rials guide ではindex: true で定義されていたが、generateしたらforeign_keyで生成されていた。
      # 外部キー制約で引っかかったらここが原因
      t.references :article, index: true

      t.timestamps
    end
  end
end
