class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_body
      t.string :user_email
      t.timestamps
    end
  end
end
