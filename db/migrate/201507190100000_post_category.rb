class PostCategory < ActiveRecord::Migration
  def change
    change_table(:categories) do |t|
      t.references(:post)
    end
  end
end
