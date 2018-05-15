json.extract! product, :id, :name, :price, :image, :producer, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
