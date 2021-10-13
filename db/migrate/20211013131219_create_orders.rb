# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token,
             null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure,
             null: false, default: 'gen_random_uuid()'

      t.string :order_id
      t.string :ref_order_number
      t.date :purchase_date
      t.string :status
      t.string :coupon_code
      t.integer :product_id, limit: 8
      t.string :product_name
      t.string :product_sku
      t.string :product_size
      t.float :total_weight
      t.integer :primary_category_id
      t.string :primary_category_name
      t.integer :secondary_category_id
      t.string :secondary_category_name
      t.integer :leaf_category_id
      t.string :leaf_category_name
      t.integer :quantity
      t.string :currency
      t.float :item_base_price
      t.float :item_price
      t.float :sub_total
      t.float :discount_amount
      t.float :tax_amount
      t.float :shipping_amount
      t.string :shipping_method
      t.date :region_date
      t.float :grand_total
      t.integer :customer_id, limit: 8
      t.string :customer_name
      t.string :customer_email
      t.string :customer_group
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode
      t.integer :total_order
      t.float :total_revenue
      t.string :payment_method

      ## Discard
      t.datetime :discarded_at, index: true

      t.timestamps null: false
    end
  end
end
