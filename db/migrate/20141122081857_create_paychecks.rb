class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.integer :employee_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :total_hours_worked
      t.float :gross_wages
      t.float :total_deductions
      t.float :net_wages

      t.timestamps
    end
  end
end
