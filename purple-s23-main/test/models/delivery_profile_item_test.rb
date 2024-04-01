# == Schema Information
#
# Table name: delivery_profile_items
#
#  id                   :bigint           not null, primary key
#  price_cents          :integer
#  quantity             :integer
#  salad_name           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  delivery_profiles_id :bigint
#  salad_id             :integer
#
# Indexes
#
#  index_delivery_profile_items_on_delivery_profiles_id  (delivery_profiles_id)
#
# Foreign Keys
#
#  fk_rails_...  (delivery_profiles_id => delivery_profiles.id)
#
require "test_helper"

class DeliveryProfileItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
