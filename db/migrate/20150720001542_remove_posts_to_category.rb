class RemovePostsToCategory < ActiveRecord::Migration[5.1]
  def change
    change_table(:categories) do |t|
      t.remove(:posts_id)
    end
  end
end
