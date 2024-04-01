class AddUserCartFkColToUserCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_cart_items, :usercart, foreign_key: true
  end
end
