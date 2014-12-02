class AddColumnToSelectEmployee < ActiveRecord::Migration
  def change
    add_column :select_employees, :employee_ids, :integer, array: true, default: []
  end
end
