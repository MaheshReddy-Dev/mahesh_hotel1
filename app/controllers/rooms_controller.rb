class RoomsController < InheritedResources::Base
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  
  def create
    @room = Room.new(room_params)
    flash[:notice] = "Room was successfully created."
    respond_to do |format|
      if @room.save
        format.turbo_stream
        format.html { redirect_to room_url(@room), notice: "room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
        params.require(:room).permit(:hotel_id, :room_type, :number, :price)
      end

end
