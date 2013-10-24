json.array!(@products) do |product|
  json.extract! product, :name, :price, :markup, :category_id, :supplier_id
  json.url product_url(product, format: :json)
end
