class AddColumnToPaycheck < ActiveRecord::Migration
  def change
    add_column :paychecks, :fica_deduction, :float
    add_column :paychecks, :fwh_deduction, :integer
    add_column :paychecks, :swh_deduction, :float
  end
end
