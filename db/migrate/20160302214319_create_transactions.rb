class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.date :exchange_date
      t.string :credit_or_debit
      t.string :paid_to

      t.timestamps null: false
    end
  end
end
