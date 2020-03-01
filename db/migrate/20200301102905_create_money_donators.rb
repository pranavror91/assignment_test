class CreateMoneyDonators < ActiveRecord::Migration[6.0]
  def change
    create_table :money_donators do |t|
      t.string :name
      t.string :contact_number
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
