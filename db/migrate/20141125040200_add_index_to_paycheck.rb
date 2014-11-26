class AddIndexToPaycheck < ActiveRecord::Migration
  def change
    add_index :paychecks, [:employee_id, :created_at]
  end
end
