# == Schema Information
#
# Table name: user_vitals_and_preferences
#
#  id           :bigint           not null, primary key
#  age          :integer
#  gender       :string
#  height       :integer
#  isAllGreens  :boolean
#  isAllMeats   :boolean
#  isBasics     :boolean
#  isGlutenFree :boolean
#  isTropical   :boolean
#  isVegan      :boolean
#  weight       :integer
#  weighttobe   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  userdata_id  :bigint
#
# Indexes
#
#  index_user_vitals_and_preferences_on_userdata_id  (userdata_id)
#
# Foreign Keys
#
#  fk_rails_...  (userdata_id => userdata.id)
#
require "test_helper"

class UserVitalsAndPreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
