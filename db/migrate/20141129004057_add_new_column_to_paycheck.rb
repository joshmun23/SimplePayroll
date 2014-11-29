class AddNewColumnToPaycheck < ActiveRecord::Migration
  def change
    add_column :paychecks, :select_employees_id, :integer
  end
end
