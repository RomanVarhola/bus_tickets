class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :admin_user!, only: [:index]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @journeys = @user.journeys.uniq
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    
  def set_user
    @user = current_user
  end

  def admin_user!
    unless current_user.role.name == 'admin'
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You are not admin ' }
      end
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city)
  end
end
