# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  contact    :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
	has_many :products

	validates_presence_of :name, :message => "can't be empty"
	validates :contact, :presence => {:message => 'invalid mobile number'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 12 }

end
