# frozen_string_literal: true

class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: %i[edit update show destroy]

  def index
    @orders = Order.order('created_at DESC').paginate(page: params[:page])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { render :index, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { render :index, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    respond_to do |format|
      if @order.destroy
        format.html { redirect_to orders_path, alert: 'Order was successfully removed.' }
        format.json { render :index, status: :ok, location: @order }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:order_id, :ref_order_number, :purchase_date, :status, :coupon_code, :product_id,
                                  :product_name, :product_sku, :product_size, :total_weight, :primary_category_id, :primary_category_name, :secondary_category_id, :secondary_category_name, :leaf_category_id, :leaf_category_name, :quantity, :currency, :item_base_price, :item_price, :sub_total, :discount_amount, :tax_amount, :shipping_amount, :shipping_method, :region_date, :grand_total, :customer_id, :customer_name, :customer_email, :customer_group, :city, :state, :country, :postcode, :total_order, :total_revenue, :payment_method)
  end
end
