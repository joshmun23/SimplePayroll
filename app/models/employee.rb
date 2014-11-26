class Employee < ActiveRecord::Base
  has_many :paychecks, dependent: :destroy
end
