class RumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rums = policy_scope(Rum).order(created_at: :desc)
  end

  # def new
  #   @rum = Rum.new()
  # end


  # def create
  #   @rum = Rum.new(rum_params)
  #   if @rum.save
  #     redirect_to rum_path(@rum)
  #   else
  #     render :new
  #   end
  # end

  def show
    @rum = Rum.find(params[:id])
    authorize @rum
  end

  private

  def rum_params
    params.require(:rum).permit(:name, :description, :quantity, :annecdote, :availability, :price)
  end

end
