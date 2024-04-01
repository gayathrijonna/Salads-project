# == Schema Information
#
# Table name: curated_salads
#
#  id               :bigint           not null, primary key
#  calories         :integer
#  discount         :decimal(, )
#  isAllGreens      :boolean
#  isAllMeat        :boolean
#  isDiaryDiet      :boolean
#  isTropical       :boolean
#  isVegan          :boolean
#  outOfStock       :boolean
#  price_cents      :decimal(, )
#  quantities       :integer
#  saladIngredients :string
#  saladName        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class CuratedSaladTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
