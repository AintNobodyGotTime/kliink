class CreateProjectItems < ActiveRecord::Migration
  def change
    create_table :project_items do |t|
      t.string :content

      t.timestamps null: false

      t.belongs_to :project
    end
  end
end
