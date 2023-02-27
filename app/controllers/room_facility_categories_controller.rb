class RoomFacilityCategoriesController < ApplicationController
    before_action :set_room_facility_category, only: %i[ show edit update destroy ]
    before_action :authenticate_client!
  
    def index
      @room_facility_categories = RoomFacilityCategory.all
    end
  
    def show
    end
  
    def new
      @room_facility_category = RoomFacilityCategory.new
    end
  
    def edit
    end
  
    
    def create
      @room_facility_category = RoomFacilityCategory.new(room_facility_category_params)
      respond_to do |format|
        if @room.save
          format.html { redirect_to room_facility_category_url(@room_facility_category), notice: "room_facility_category was successfully created." }
          format.json { render :show, status: :created, location: @room_facility_category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @room_facility_category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @room_facility_category.update(room_facility_category_params)
          format.html { redirect_to room_facility_category_urrooml(@room_facility_category), notice: "room_facility_category was successfully updated." }
          format.json { render :show, status: :ok, location: @room }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @room_facility_category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @room_facility_category.destroy
  
      respond_to do |format|
        format.html { redirect_to room_facility_categories, notice: "room_facility_category was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      
      def set_room_facility_category
        @room_facility_category = RoomFacilityCategory.find(params[:id])
      end
  
    def room_facility_category_params
      params.require(:room_facility_category).permit()
    end

end
