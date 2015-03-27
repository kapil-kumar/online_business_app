class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :subject
      t.text :description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
