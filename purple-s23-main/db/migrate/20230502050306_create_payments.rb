class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :cardnumber
      t.string :cardholdername
      t.integer :expirydate
      t.integer :cvv
      t.integer :zipcode
      t.string :paymentstatus

      t.timestamps
    end
  end
end
