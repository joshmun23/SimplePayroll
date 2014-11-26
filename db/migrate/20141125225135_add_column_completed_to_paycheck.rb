class AddColumnCompletedToPaycheck < ActiveRecord::Migration
  def change
    add_column :paychecks, :completed, :boolean
  end
end
