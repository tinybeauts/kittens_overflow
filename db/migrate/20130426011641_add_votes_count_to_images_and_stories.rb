class AddVotesCountToImagesAndStories < ActiveRecord::Migration
  def change
    add_column :images, :votes_count, :integer, default: 0, null: false
    add_column :stories, :votes_count, :integer, default: 0, null: false
  end
end
