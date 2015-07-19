class PostCategory < ActiveRecord::Migration
  def change
    change_table(:categories) do |t|
      t.references(:posts)
    end
  end
end
