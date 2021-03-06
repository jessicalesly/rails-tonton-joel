class ReviewsController < ApplicationController
  # def new
  #   @rum = Rum.find(params[:rum_id])
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @rum = Rum.find(params[:rum_id])
    @review.rum = @rum
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to rum_path(@rum)
    else
      @order = Order.new
      render "rums/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
