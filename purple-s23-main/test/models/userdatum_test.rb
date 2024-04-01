# == Schema Information
#
# Table name: userdata
#
#  id         :bigint           not null, primary key
#  address    :string
#  emailid    :string
#  firstname  :string
#  lastname   :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_userdata_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class UserdatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
