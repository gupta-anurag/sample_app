class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :micropost_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps 
    end
    # add index :comments, [:user_id, :micropost_id, :created_at, :updated_at]
  end
end
