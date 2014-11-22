json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :wage, :marital_status, :fica, :fwh, :swh, :claims
  json.url employee_url(employee, format: :json)
end
