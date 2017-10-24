class JourneysController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :destroy,:choosing_places, :bought_tickets, :return_tickets]
  before_action :admin_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  def index
    @journeys = Journey.all.filter(params.slice(:date_of_departure)).paginate(page: params[:page], per_page: 20)
    @journey = Journey.new
  end

  def show
    @users = @journey.users.uniq
  end

  def new
    @journey = Journey.new
  end

  def edit
  end

  def choosing_places
    @journey = Journey.find(params[:journey_id])
  end

  def bought_tickets
    @journey = Journey.find(params[:journey_id])
    @numbers = params[:place_ids]
    current_user.journeys << @journey
    @numbers.map{|n| Place.create(number: n, journey_id: @journey.id, user_id: current_user.id)}
    
    respond_to do |format|
      format.html { redirect_to journey_path(@journey), notice: 'You have bought tickets' }
    end
  end

  def search
    filter_params = params[:journey]
    filter_params = Journey.new if filter_params.nil?
    @journeys     = Journey.filter(filter_params.slice(:place_of_departure, :place_of_arrive, :date_of_departure))
                        .order(:id)
                        .paginate(page: params[:page], per_page: 30)
    @journey  = Journey.new
    @journey.attributes = params[:journey].permit(:place_of_departure, :place_of_arrive, :date_of_departure) unless params[:journey].nil?

    render :index
  end

  def create
    @journey = Journey.new(journey_params)

    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journey.users.destroy_all
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def return_tickets
    @journey = Journey.find(params[:journey_id])
    @user = User.find(params[:user_id])
    @user.journeys.destroy_all
    @places = Place.where(journey_id: @journey.id, user_id: @user.id)
    @places.destroy_all
    respond_to do |format|
      format.html { redirect_to journey_path(@journey), notice: 'Tickets were successfully returned.' }
      format.json { head :no_content }
    end
  end

  private
    
  def set_journey
    @journey = Journey.find(params[:id])
  end

  def admin_user!
    unless current_user.role.name == 'admin'
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You are not admin ' }
      end
    end
  end

  def journey_params
    params.require(:journey).permit(:count_of_seats,
                                    :place_of_departure,
                                    :date_of_departure,
                                    :place_of_arrive,
                                    :date_of_arrive
                                    )
  end
end
