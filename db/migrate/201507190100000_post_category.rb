class PostCategory < ActiveRecord::Migration[5.1]
  def change
    change_table(:categories) do |t|
      t.references(:post)
    end
  end
end
