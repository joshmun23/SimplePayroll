class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.float :wage
      t.string :marital_status
      t.float :fica
      t.float :fwh
      t.float :swh
      t.integer :claims

      t.timestamps
    end
  end
end
