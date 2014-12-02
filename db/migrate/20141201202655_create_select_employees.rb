class CreateSelectEmployees < ActiveRecord::Migration
  def change
    create_table :select_employees do |t|
      t.timestamps
    end
  end
end
