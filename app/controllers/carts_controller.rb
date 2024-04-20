class CartsController < ApplicationController

  def index
    @cart = PartsSoftService.cart_items
  end

  def add
    PartsSoftService.add_item_cart(item_params)
    redirect_to cart_path
  end

  private

  def item_params
    params.permit(:oem, :make_name, :detail_name, :qnt, :comment, :min_delivery_day, :max_delivery_day, :api_hash)
  end

end
