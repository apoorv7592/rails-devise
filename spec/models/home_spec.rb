# == Schema Information
#
# Table name: homes
#
#  id            :integer          not null, primary key
#  banner_name   :string
#  path          :string
#  classified_as :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank          :integer
#

require 'rails_helper'

RSpec.describe Home, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
