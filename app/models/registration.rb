class Registration < ActiveRecord::Base
	validates_uniqueness_of :registration_id, scope: [:user_id]
end
