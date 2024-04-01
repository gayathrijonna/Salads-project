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
class Ingredient < ApplicationRecord
    belongs_to(
    :icategory,
    class_name:  'Icategory',
    foreign_key: 'icategory_id',
    inverse_of:  :ingredients
  )
end
