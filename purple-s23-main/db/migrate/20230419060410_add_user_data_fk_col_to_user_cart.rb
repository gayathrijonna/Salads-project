class AddUserDataFkColToUserCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :usercarts, :userdata, foreign_key: true
  end
end
