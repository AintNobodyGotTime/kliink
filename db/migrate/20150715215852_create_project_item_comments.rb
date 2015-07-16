class CreateProjectItemComments < ActiveRecord::Migration
  def change
    create_table :project_item_comments do |t|
      t.string :content

      t.timestamps null: false

      t.belongs_to :project_item
    
    end
  end
end
