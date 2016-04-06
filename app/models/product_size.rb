# == Schema Information
#
# Table name: product_sizes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  size       :string           not null
#  qty_avail  :integer          default(0)
#  size_unit  :integer          default(0)
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :integer
#  mrp        :integer
#  price      :integer
#

class ProductSize < ActiveRecord::Base
	belongs_to :product

	enum status: [:disabled, :enabled, :discontinued]
	enum size_unit: [:ml, :gm, :kg, :litre, :piece]

	validates_presence_of :size, :product_id, :qty_avail
end
 
