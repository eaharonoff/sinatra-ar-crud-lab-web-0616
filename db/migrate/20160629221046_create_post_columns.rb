class CreatePostColumns < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.column :name, :string, limit: 60
      t.column :content, :string
    end
  end
end
