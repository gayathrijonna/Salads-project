# == Schema Information
#
# Table name: user_cart_items
#
#  id          :bigint           not null, primary key
#  dressing    :string
#  price_cents :decimal(, )
#  quantities  :integer
#  salad_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  salad_id    :integer
#  usercart_id :bigint
#
# Indexes
#
#  index_user_cart_items_on_usercart_id  (usercart_id)
#
# Foreign Keys
#
#  fk_rails_...  (usercart_id => usercarts.id)
#
require "test_helper"

class UserCartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
