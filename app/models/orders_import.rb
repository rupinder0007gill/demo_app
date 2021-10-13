# frozen_string_literal: true

class OrdersImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_orders
    spreadsheet = open_spreadsheet
    header = %w[order_id ref_order_number purchase_date status coupon_code product_id product_name
                product_sku product_size total_weight primary_category_id primary_category_name secondary_category_id secondary_category_name leaf_category_id leaf_category_name quantity currency item_base_price item_price sub_total discount_amount tax_amount shipping_amount shipping_method region_date grand_total customer_id customer_name customer_email customer_group city state country postcode total_order total_revenue payment_method]
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      order = Order.find_by_order_id(row['order_id']) || Order.new
      order.attributes = row.to_hash
      order
    end
  end

  def imported_orders
    @imported_orders ||= load_imported_orders
  end

  def save
    if imported_orders.map(&:valid?).all?
      imported_orders.each(&:save!)
      true
    else
      imported_orders.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 2}: #{msg}"
        end
      end
      false
    end
  end
end
