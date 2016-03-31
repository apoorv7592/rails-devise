class ProductSize < ActiveRecord::Base
	belongs_to :product

	enum status: [:disabled, :enabled, :discontinued]
	enum size_unit: [:ml, :gm, :kg, :litre, :piece]

	validates_presence_of :size, :product_id, :qty_avail
end
 