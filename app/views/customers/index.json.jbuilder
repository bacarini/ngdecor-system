json.array!(@customers) do |customer|
  json.extract! customer, :name, :phone, :mobile, :address
  json.url customer_url(customer, format: :json)
end
