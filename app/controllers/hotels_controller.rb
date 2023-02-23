class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def show
  end
  def edit
    if params[:hotel] && params[:hotel][:region_ids]
      @region = Array.new
      params[:hotel][:region_ids].each do |r|
        r = r.to_i
        @region << Region.find(r)
      end
     end
  end
  

 def new
    @hotel = Hotel.new(hotel_params)
    if params[:hotel] && params[:hotel][:region_ids]
     @region = Array.new
     params[:hotel][:region_ids].each do |r|
       r = r.to_i
       @region << Region.find(r)
     end
    end
  end

  def create
    @hotel = current_client.hotels.build(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.fetch(:library, {}).permit(:name,:client_id, location_ids: [], region_ids: [])
    end

end

