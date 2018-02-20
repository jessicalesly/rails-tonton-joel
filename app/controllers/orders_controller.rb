class OrdersController < ApplicationController
  def index
    @orders_purchase = policy_scope(Order).where(user: current_user)
    @orders_sale = policy_scope(Order).where
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.rum = Rum.find(params[:rum_id])
    @order.user = current_user
    if @order.save
      redirect_to orders_path
    else
      render "rums/show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :status)
  end

end
