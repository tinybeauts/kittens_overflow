class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id, :null => false
      t.integer :image_id, :null => false
      t.text    :body, :null => false

      t.timestamps
    end
    add_index :stories, :user_id
    add_index :stories, :image_id
  end
end
