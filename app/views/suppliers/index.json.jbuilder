json.array!(@suppliers) do |supplier|
  json.extract! supplier, :name, :cnpj, :address, :phone
  json.url supplier_url(supplier, format: :json)
end
