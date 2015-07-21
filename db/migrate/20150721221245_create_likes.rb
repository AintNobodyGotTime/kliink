class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :project_item
    end
  end
end
