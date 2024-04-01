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
class CuratedSalad < ApplicationRecord
    monetize :price_cents
    has_one_attached    :salad_image

    validates_numericality_of :quantities, greater_than_or_equal_to: 0
end
