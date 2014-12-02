json.array!(@select_employees) do |select_employee|
  json.extract! select_employee, :id
  json.url select_employee_url(select_employee, format: :json)
end
