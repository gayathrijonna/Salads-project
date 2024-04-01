# == Schema Information
#
# Table name: usercarts
#
#  id          :bigint           not null, primary key
#  dressing_at :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  userdata_id :bigint
#
# Indexes
#
#  index_usercarts_on_userdata_id  (userdata_id)
#
# Foreign Keys
#
#  fk_rails_...  (userdata_id => userdata.id)
#
require "test_helper"

class UsercartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
