class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount

      t.timestamps null: false
      t.belongs_to :user
      t.belongs_to :project

    end
  end
end
