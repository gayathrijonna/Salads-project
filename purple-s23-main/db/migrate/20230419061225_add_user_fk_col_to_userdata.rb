class AddUserFkColToUserdata < ActiveRecord::Migration[7.0]
  def change
    add_reference :userdata, :user, foreign_key: true
  end
end
