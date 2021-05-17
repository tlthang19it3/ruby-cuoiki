class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|

      t.string :name
      t.string :email
      t.string :phone_number
      t.string :pass_word
      t.string :name_bank
      t.string :number_acc_bank
      t.string :name_acc_bank
      t.string :branch_bank
      t.string :address
    end
  end
end
