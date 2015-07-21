class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :project
    end
  end
end
