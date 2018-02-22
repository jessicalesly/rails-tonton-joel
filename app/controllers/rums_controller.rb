class RumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rums = policy_scope(Rum).order(created_at: :desc)
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
    @rums = Rum.where.not(latitude: nil, longitude: nil)

    @markers = @rums.map do |rum|
      {
        lat: rum.latitude,
        lng: rum.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  private

  def rum_params
    params.require(:rum).permit(:name, :description, :volume, :annecdote, :availability, :price)
  end
#

end
