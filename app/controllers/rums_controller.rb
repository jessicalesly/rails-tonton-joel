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

  def update_status
    @rum = Rum.find(params[:id])
    authorize @rum
    if @rum.availability
      @rum.availability = false
    else
      @rum.availability = true
    end
    @rum.save
    redirect_to orders_path
  end

  def show
    @rum = Rum.find(params[:id])
    @review = Review.new
    @order = Order.new
    authorize @rum
    @rums = Rum.where.not(latitude: nil, longitude: nil)

    @markers = [{
        lat: @rum.latitude,
        lng: @rum.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  private

  def rum_params
    params.require(:rum).permit(:photo, :name, :description, :volume, :annecdote, :origin, :availability, :price)
  end
#

end
