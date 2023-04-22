# frozen_string_literal: true

class RoomFacilitiesController < ApplicationController
  before_action :set_room_facility, only: %i[show edit update destroy]
  before_action :authenticate_client!

  def index
    @room_facilities = RoomFacility.all
  end

  def show; end

  def new
    @room_facility = RoomFacility.new
  end

  def edit; end

  def create
    @room_facility = RoomFacility.new(room_facility_params)
    respond_to do |format|
      if @room_facility.save
        format.html { redirect_to root_path, notice: 'Room Facility was successfully added.' }
        format.json { render :show, status: :created, location: @room_facility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_facility.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room_facility.update(room_facility_params)
        format.html { redirect_to room_facility_url(@room_facility), notice: 'Room Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_facility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_facility.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room_facility.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Room Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_room_facility
    @room_facility = RoomFacility.find(params[:id])
  end

  def room_facility_params
    params.require(:room_facility).permit(:room_id, :room_facility_category_id, :name)
  end
end
