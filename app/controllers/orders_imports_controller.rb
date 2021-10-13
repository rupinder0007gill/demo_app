# frozen_string_literal: true

class OrdersImportsController < ApplicationController
  def new
    @orders_import = OrdersImport.new
  end

  def create
    @orders_import = OrdersImport.new(params[:orders_import])
    if @orders_import.save
      redirect_to orders_path, notice: 'Order successfully imported.'
    else
      render :new
    end
  end
end
