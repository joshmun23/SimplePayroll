class Employee < ActiveRecord::Base
  has_many :paychecks, dependent: :destroy
  validates :name, presence: true
  validates :wage, presence: true,
                   numericality: true
  validates :marital_status, presence: true

  validates :fica, presence: true,
                   numericality: true
  validates :fwh, presence: true,
                   numericality: true
  validates :fwh_fixed, presence:true,
                   numericality: true
  validates :swh, presence: true,
                   numericality: true
end                
