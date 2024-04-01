# == Schema Information
#
# Table name: delivery_profiles
#
#  id           :bigint           not null, primary key
#  dressings    :integer
#  price_cents  :integer
#  profile_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  userdata_id  :bigint
#
# Indexes
#
#  index_delivery_profiles_on_userdata_id  (userdata_id)
#
# Foreign Keys
#
#  fk_rails_...  (userdata_id => userdata.id)
#
class DeliveryProfile < ApplicationRecord
    belongs_to(
        :userdata,
        class_name:  'Userdatum',
        foreign_key: 'userdata_id'
    )

    has_many(
    :delivery_profile_items,
        class_name:  'DeliveryProfileItem',
        foreign_key: 'delivery_profiles_id',
        inverse_of:  :delivery_profile_items,
        dependent:   :destroy
    )

    monetize :price_cents
end
