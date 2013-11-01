json.array!(@sellers) do |seller|
  json.extract! seller, :name, :phone, :cnpj, :email
  json.url seller_url(seller, format: :json)
end
