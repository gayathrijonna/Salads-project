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
class Usercart < ApplicationRecord
    belongs_to(
    :userdata,
    class_name:  'Userdatum',
    foreign_key: 'userdata_id'
  )

  has_many(
    :user_cart_items,
    class_name:  'UserCartItems',
    foreign_key: 'usercart_id',
    inverse_of:  :usercarts,
    dependent:   :destroy
  )
end
