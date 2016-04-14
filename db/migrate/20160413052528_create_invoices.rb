class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :order_id, index: true
      t.text :invoice_note
      t.integer :admin_user_id
      t.datetime :invoice_date, index: true

      t.timestamps null: false
    end
  end
end
