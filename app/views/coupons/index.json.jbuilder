json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :code, :valid_product, :valid_category, :valid_company, :valid_city, :value, :value_type, :qualifying_amount, :max_discount, :max_usage, :max_usage_per_user, :expire_date, :start_date, :success_message, :coupon_message, :status
  json.url coupon_url(coupon, format: :json)
end
