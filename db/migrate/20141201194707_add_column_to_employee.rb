class AddColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :selected, :boolean
  end
end
