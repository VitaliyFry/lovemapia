class PlacesController < ApplicationController

  def index
    @places = Place.where(nil)

    filtering_params(params).each do |key, value|
      @places = @places.public_send(key, value) if value.present?
    end

    @c = params[:category_id]

    render json: @places
  end

  def show
    @place = Place.find(params[:id]).decorate
    @reviews = @place.reviews
    @place.increment!(:visits)
    @near_places = Place.near([@place.latitude, @place.longitude], 5)
  end

  def new
    @place = Place.new
    @categories = Category.all
    get_current_coordinates
  end

  def create
    @place = Place.new(place_params)
    @place.save!
    flash[:success] = 'Место отправлено на модерацию'
    redirect_to place_path(@place.id)
  end

  private

    def place_params
      params.require(:place).permit(:title, :category_id, :address, :description, :image1, :image2, :image3).merge(rating: params[:rating], latitude: params[:latitude], longitude: params[:longitude] )
    end

    def filtering_params(params)
      params.slice(:category_id, :reviews_count, :rating)
    end
end
