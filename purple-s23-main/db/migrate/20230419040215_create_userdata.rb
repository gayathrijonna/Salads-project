class CreateUserdata < ActiveRecord::Migration[7.0]
  def change
    create_table :userdata do |t|
      t.string :firstname
      t.string :lastname
      t.string :emailid
      t.string :mobile
      t.string :address

      t.timestamps
    end
  end
end
