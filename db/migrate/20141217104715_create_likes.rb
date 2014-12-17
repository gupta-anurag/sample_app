class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :table
      t.id :content
      t.integer :likeable_id
      t.integer :likeable_type
      t.text :created_at
      t.text :updated_at

      t.timestamps
    end
  end
end
