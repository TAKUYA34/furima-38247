class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order_shiadds = OrderShiAdds.new
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_shiadds = OrderShiAdds.new(order_params)
    if @order_shiadds.valid?
      pay_item
      @order_shiadds.save
      redirect_to root_path
   else
    render "orders/index"
   end
  end

  private

  def order_params
    params.require(:order_shi_adds).permit(:post_code, :sender_id, :locality, :address, :building, :phone ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
