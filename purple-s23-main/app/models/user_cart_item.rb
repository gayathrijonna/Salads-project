# == Schema Information
#
# Table name: user_cart_items
#
#  id          :bigint           not null, primary key
#  dressing    :string
#  price_cents :decimal(, )
#  quantities  :integer
#  salad_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  salad_id    :integer
#  usercart_id :bigint
#
# Indexes
#
#  index_user_cart_items_on_usercart_id  (usercart_id)
#
# Foreign Keys
#
#  fk_rails_...  (usercart_id => usercarts.id)
#
class UserCartItem < ApplicationRecord
    monetize :price_cents
    belongs_to(
    :usercart,
    class_name:  'Usercart',
    foreign_key: 'usercart_id'
    )

    validates :salad_name, inclusion: { in: ->(_) { CuratedSalad.pluck(:saladName) }, message: "is not a valid salad name" }
    validates :salad_id, inclusion: { in: ->(_) { CuratedSalad.pluck(:id) }, message: "is not a valid salad id" }
end
