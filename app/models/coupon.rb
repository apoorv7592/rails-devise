# == Schema Information
#
# Table name: coupons
#
#  id                 :integer          not null, primary key
#  code               :string
#  valid_product      :text
#  valid_category     :text
#  valid_company      :text
#  valid_city         :text
#  value              :integer
#  value_type         :integer
#  qualifying_amount  :integer
#  max_discount       :integer
#  max_usage          :integer
#  max_usage_per_user :integer
#  expire_date        :datetime
#  start_date         :datetime
#  success_message    :string
#  coupon_message     :string
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Coupon < ActiveRecord::Base

	enum status: [:disabled, :enabled, :discontinued]
    enum value_type: [:percentage, :flat]
    validates_uniqueness_of :code, :length => { :minimum => 2, :maximum => 15 }
    #product_id present in valid_product
    #category_id presence
    #company_presence
    #date check
    #qualifying amount check
 


    def coupon_check(code,product_id)


    end

end
