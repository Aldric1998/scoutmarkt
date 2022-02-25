class RentsController < ApplicationController
  def index
    # @rents= policy_scope(Rent)
    if params[:query].present?
      sql_query = " \
        rents.name @@ :query \
        OR rents.description @@ :query \

      "
      @rents = Rent.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @rents = Rent.all
    end

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

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to rents_path
  end

  private

  def rent_params
    params.require(:rent).permit(:price, :description, :name, :offer_category, :category, :start_date, :end_date, :address)
  end
end
