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
class DeliveryProfileItem < ApplicationRecord
    monetize :price_cents
    belongs_to(
        :delivery_profiles,
        class_name:  'DeliveryProfile',
        foreign_key: 'delivery_profiles_id'
    )

    validates :salad_name, inclusion: { in: ->(_) { CuratedSalad.pluck(:saladName) }, message: "is not a valid salad name" }
    validates :salad_id, inclusion: { in: ->(_) { CuratedSalad.pluck(:id) }, message: "is not a valid salad id" }
end
