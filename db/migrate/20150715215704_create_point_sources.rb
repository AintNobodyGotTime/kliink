class CreatePointSources < ActiveRecord::Migration
  def change
    create_table :point_sources do |t|
      t.string :source
      t.integer :points

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :project
    end
  end
end
