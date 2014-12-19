class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|
      t.integer :comment_id

      t.timestamps
    end
  end
end
