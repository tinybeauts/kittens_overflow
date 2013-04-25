class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :source_url
      t.string :owner

      t.timestamps
    end
  end
end
