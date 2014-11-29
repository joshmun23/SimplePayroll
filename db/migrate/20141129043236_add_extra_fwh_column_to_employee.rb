class AddExtraFwhColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :fwh_fixed, :float
  end
end
