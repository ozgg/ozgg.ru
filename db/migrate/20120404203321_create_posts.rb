class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :alias
      t.text :body_raw
      t.text :body
      t.text :preview
      t.text :description

      t.timestamps
    end
  end
end
