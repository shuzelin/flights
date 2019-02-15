class FlightInfosController < ApplicationController
  before_action :set_flight_info, only: [:show, :edit, :update, :destroy]

  # GET /flight_infos
  # GET /flight_infos.json
  def index
    @flight_infos = FlightInfo.all
  end

  # GET /flight_infos/1
  # GET /flight_infos/1.json
  def show
  end

  # GET /flight_infos/new
  def new
    @flight_info = FlightInfo.new
  end

  # GET /flight_infos/1/edit
  def edit
  end

  # POST /flight_infos
  # POST /flight_infos.json
  def create
    @flight_info = FlightInfo.new(flight_info_params)

    respond_to do |format|
      if @flight_info.save
        format.html { redirect_to @flight_info, notice: 'Flight info was successfully created.' }
        format.json { render :show, status: :created, location: @flight_info }
      else
        format.html { render :new }
        format.json { render json: @flight_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flight_infos/1
  # PATCH/PUT /flight_infos/1.json
  def update
    respond_to do |format|
      if @flight_info.update(flight_info_params)
        format.html { redirect_to @flight_info, notice: 'Flight info was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight_info }
      else
        format.html { render :edit }
        format.json { render json: @flight_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_infos/1
  # DELETE /flight_infos/1.json
  def destroy
    @flight_info.destroy
    respond_to do |format|
      format.html { redirect_to flight_infos_url, notice: 'Flight info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_info
      @flight_info = FlightInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_info_params
      params.require(:flight_info).permit(:filght_number, :from_city, :to_city, :airline_id, :sched)
    end
end
