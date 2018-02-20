class OrdersController < ApplicationController
  def index
    @orders_purchases = policy_scope(Order).where(user: current_user)
    @orders_sales = policy_scope(Order).where.not(user: current_user)
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
  end

  def refuse
    update_status("refusé")
  end

  def accept
    update_status("accepté")
  end

  private

  def update_status(new_status)
    @order = Order.find(params[:id])
    @order.status = new_status
    @order.save!
    authorize @order
    redirect_to orders_path
  end

  def order_params
    params.require(:order).permit(:quantity, :status)
  end

end



#   <%= link_to "Annuler", cancel_order_path(order) %>
#   <%= link_to "Accepter", accept_order_path(order) %>
#   <%= link_to "Refuser", refuse_order_path(order) %>
