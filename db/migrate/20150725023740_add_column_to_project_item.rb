class AddColumnToProjectItem < ActiveRecord::Migration
  def change
    add_column :project_items, :url, :string
  end
end
