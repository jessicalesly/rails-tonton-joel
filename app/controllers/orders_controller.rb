class OrdersController < ApplicationController
  def index
    orders = policy_scope(Order)
    @orders_purchases = orders.select { |order| order.user == current_user }
    @orders_sales = orders.select { |order| order.user != current_user }
    @my_rums = current_user.rums
  end

  def create
    sleep 2
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
