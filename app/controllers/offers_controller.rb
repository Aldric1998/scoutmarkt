class OffersController < ApplicationController
  def index
    @offers = Offer.all
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        infoWindow: { content: render_to_string(partial: "/offers/map_box", locals: { offer: offer }) }
      }
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_category_path
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :description, :name, :offer_category, :category, :start_date, :end_date, :localisation)
  end
end
