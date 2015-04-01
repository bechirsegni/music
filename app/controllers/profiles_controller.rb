class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = current_user.build_profile(params[:profile])
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_url , notice: 'Your Porfile was succesfully updated'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path , notice: 'Profile was successfully destroyed.'
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:location,:about,:description,:twitter,:facebook,:google)
  end

  def correct_user
    @profile = current_user.profiles.find_by(id: params[:id])
    redirect_to profiles_path, notice: "Not authorized to edit this Profile" if @profile.nil?
  end

end