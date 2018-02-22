class RumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  if params[:query].present?
      @rums = Rum.where(availability: true).search_rum(params[:query]).to_a
    else
      @rums = policy_scope(Rum).where(availability: true).order(created_at: :desc)
    end
  end

  def new
    @rum = Rum.new()
    authorize @rum
  end

  def create
    @rum = Rum.new(rum_params)
    @rum.user = current_user
    authorize @rum
    if @rum.save
      redirect_to rum_path(@rum)
    else
      render :new
    end
  end

  def edit
    @rum = Rum.find(params[:id])
    authorize @rum
  end

  def update
    @rum = Rum.find(params[:id])
    authorize @rum
    if @rum.update(rum_params)
      redirect_to rum_path(@rum)
    else
      render :edit
    end
  end

  def show
    @rum = Rum.find(params[:id])
    @order = Order.new
    authorize @rum
  end

  private

  def rum_params
    params.require(:rum).permit(:name, :description, :volume, :annecdote, :origin, :availability, :price)
  end
#

end
