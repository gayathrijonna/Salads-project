# == Schema Information
#
# Table name: delivery_profiles
#
#  id           :bigint           not null, primary key
#  dressings    :integer
#  price_cents  :integer
#  profile_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  userdata_id  :bigint
#
# Indexes
#
#  index_delivery_profiles_on_userdata_id  (userdata_id)
#
# Foreign Keys
#
#  fk_rails_...  (userdata_id => userdata.id)
#
require "test_helper"

class DeliveryProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
