# == Schema Information
#
# Table name: ingredients
#
#  id           :bigint           not null, primary key
#  icalorie     :integer
#  icarbo       :integer
#  icheck       :boolean
#  ifat         :integer
#  iname        :string
#  iprotein     :integer
#  isAllGreens  :boolean
#  isAllMeat    :boolean
#  isVegan      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  icategory_id :bigint
#
# Indexes
#
#  index_ingredients_on_icategory_id  (icategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (icategory_id => icategories.id)
#
require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
