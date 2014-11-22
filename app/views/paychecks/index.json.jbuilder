json.array!(@paychecks) do |paycheck|
  json.extract! paycheck, :id, :employee_id, :name, :start_date, :end_date, :total_hours_worked, :gross_wages, :total_deductions, :net_wages
  json.url paycheck_url(paycheck, format: :json)
end
