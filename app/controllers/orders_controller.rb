class OrdersController < ApplicationController
  def index
    @orders_purchases = policy_scope(Order).select do |order|
      order.user == current_user
    end
    @orders_sales = policy_scope(Order).select do |order|
      order.user != current_user
    end
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

  def cancel
    update_status("annulé")
    authorize @order
    @order.save!
    redirect_to orders_path
  end

  def refuse
    update_status("refusé")
    authorize @order
    @order.save!
    redirect_to orders_path
  end

  def accept
    update_status("accepté")
    authorize @order
    @order.save!
    redirect_to orders_path
  end

  def pay
    update_status("finalisé")
    authorize @order
    @order.save!
    redirect_to orders_path
  end

  private

  def update_status(new_status)
    @order = Order.find(params[:id])
    @order.status = new_status
  end

  def order_params
    params.require(:order).permit(:quantity, :status)
  end

end
