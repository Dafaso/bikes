json.extract! shop, :id, :name, :location, :website, :street1, :street2, :city, :state, :phone, :zip, :email, :contact_name, :contact_email, :contact_phone, :description, :notes, :created_at, :updated_at
json.url shop_url(shop, format: :json)
