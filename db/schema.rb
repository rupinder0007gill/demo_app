# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_013_131_219) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'orders', force: :cascade do |t|
    t.uuid 'uuid_token', default: -> { 'gen_random_uuid()' }, null: false
    t.uuid 'uuid_secure', default: -> { 'gen_random_uuid()' }, null: false
    t.string 'order_id'
    t.string 'ref_order_number'
    t.date 'purchase_date'
    t.string 'status'
    t.string 'coupon_code'
    t.bigint 'product_id'
    t.string 'product_name'
    t.string 'product_sku'
    t.string 'product_size'
    t.float 'total_weight'
    t.integer 'primary_category_id'
    t.string 'primary_category_name'
    t.integer 'secondary_category_id'
    t.string 'secondary_category_name'
    t.integer 'leaf_category_id'
    t.string 'leaf_category_name'
    t.integer 'quantity'
    t.string 'currency'
    t.float 'item_base_price'
    t.float 'item_price'
    t.float 'sub_total'
    t.float 'discount_amount'
    t.float 'tax_amount'
    t.float 'shipping_amount'
    t.string 'shipping_method'
    t.date 'region_date'
    t.float 'grand_total'
    t.bigint 'customer_id'
    t.string 'customer_name'
    t.string 'customer_email'
    t.string 'customer_group'
    t.string 'city'
    t.string 'state'
    t.string 'country'
    t.string 'postcode'
    t.integer 'total_order'
    t.float 'total_revenue'
    t.string 'payment_method'
    t.datetime 'discarded_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['discarded_at'], name: 'index_orders_on_discarded_at'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'discarded_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['discarded_at'], name: 'index_roles_on_discarded_at'
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource'
  end

  create_table 'users', force: :cascade do |t|
    t.uuid 'uuid_token', default: -> { 'gen_random_uuid()' }, null: false
    t.uuid 'uuid_secure', default: -> { 'gen_random_uuid()' }, null: false
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'discarded_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'token'
    t.string 'uid'
    t.string 'refresh_token'
    t.string 'provider'
    t.index ['discarded_at'], name: 'index_users_on_discarded_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
    t.index ['uuid_secure'], name: 'index_users_on_uuid_secure', unique: true
    t.index ['uuid_token'], name: 'index_users_on_uuid_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end
end
