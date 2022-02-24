class RentsController < ApplicationController
  def index
    @rents = Rent.all
    @markers = @rents.geocoded.map do |rent|
      {
        lat: rent.latitude,
        lng: rent.longitude,
        info_window: render_to_string(partial: "rents/info_window", locals: { rent: rent })
      }
    end
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.save
    redirect_to offer_category_path
  end

  def show
    @rent = Rent.find(params[:id])
  end

  private

  def rent_params
    params.require(:rent).permit(:price, :description, :name, :offer_category, :category, :start_date, :end_date, :address)
  end
end
