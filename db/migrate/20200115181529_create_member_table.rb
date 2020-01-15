class CreateMemberTable < ActiveRecord::Migration[5.2]
  def up
    create_table :members do |table|
      table.string :first_name, null: false
      table.string :last_name, null: false
      table.string :specialty, null: false
      table.belongs_to :ship, null: false
    end
  end

  def down
    drop_table :members
  end
end
