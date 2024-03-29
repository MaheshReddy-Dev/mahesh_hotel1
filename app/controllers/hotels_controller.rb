# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]
  before_action :authenticate_client!

  def index
    @hotels = Hotel.all
  end

  def show; end

  def edit
    return unless params[:hotel] && params[:hotel][:region_ids]

    @region = []
    params[:hotel][:region_ids].each do |r|
      r = r.to_i
      @region << Region.find(r)
    end
  end

  def new
    @hotel = Hotel.new(hotel_params)
    return unless params[:hotel] && params[:hotel][:region_ids]

    @region = []
    params[:hotel][:region_ids].each do |r|
      r = r.to_i
      @region << Region.find(r)
    end
  end

  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html do
          if request.referer.include?('hotels/new')
            redirect_to hotels_path, notice: 'Hotel was created successfully.'
          else
            redirect_to root_path, notice: 'Hotel was created successfully.'
          end
        end
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html do
          if request.referer.include?('hotels/edit')
            redirect_to root_path, notice: 'Hotel deatils updated sucessfully.'
          else
            redirect_to @hotel, notice: 'Hotel deatils updated sucessfully.'
          end
        end
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.fetch(:hotel, {}).permit(:name, :room_id, :client_id, location_ids: [], region_ids: [])
  end
end
