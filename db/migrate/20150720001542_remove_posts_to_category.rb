class RemovePostsToCategory < ActiveRecord::Migration
  def change
    change_table(:categories) do |t|
      t.remove(:posts_id)
    end
  end
end
