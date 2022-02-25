class OffersController < ApplicationController
  def index
    # @offers= policy_scope(Offer)
    if params[:query].present?
      sql_query = " \
        offers.name @@ :query \
        OR offers.description @@ :query \
      "
      @offers = Offer.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
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
    @markers = @offer.geocode
    @markers = [{
        lat: @offer.latitude,
        lng: @offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: @offer }),
      }]
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :description, :name, :offer_category, :category, :address, :start_date, :end_date)
  end
end
