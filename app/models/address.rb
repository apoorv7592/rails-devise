# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  first_name :string(100)
#  last_name  :string(100)
#  pincode    :integer
#  landmark   :text
#  address    :text
#  mobile     :string(15)
#  status     :integer          default(1)
#  city       :string
#  state      :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
end
