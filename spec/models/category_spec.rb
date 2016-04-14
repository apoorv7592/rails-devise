# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  status      :integer
#  parent_id   :integer
#  url_string  :string
#  seo_title   :string
#  seo_meta    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
