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
  validates_presence_of :code, :value, :qualifying_amount, :max_discount, :expire_date, :start_date, :message => "can't be empty"

end
