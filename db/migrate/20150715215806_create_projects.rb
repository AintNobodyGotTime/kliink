class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
      
      t.belongs_to :user
      t.belongs_to :ngo
    end
  end
end
