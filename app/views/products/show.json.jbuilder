json.extract! @product, :id, :created_at, :updated_at, :name, :description, :url, :meta_title,:meta_description,:meta_keywords,:company_id,:price,:mrp,:weight,:rank,:status
    json.sizes do |json|
      json.array! @product.product_sizes do |product_size|
        if product_size.status=="enabled"
          json.size product_size.size
          json.product_size_id product_size.id
          json.extract! product_size, :qty_avail, :size_unit
        end
      end
    end