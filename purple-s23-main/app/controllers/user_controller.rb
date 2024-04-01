class UserController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  layout false

  def home
      render :home
  end
  
  def index
      @userdata = Userdatum.find_by(user_id: current_user.id)
      @userdata.emailid = current_user.email
      @uservitals = UserVitalsAndPreference.find_by(userdata_id: @userdata.id)
      render :profile
  end

  def update
    @userdata = Userdatum.find_by(user_id: current_user.id)
    @uservitals = UserVitalsAndPreference.find_by(userdata_id: @userdata.id)
    updateFlag = false
    if params[:userdatum]
      if @userdata.update(params.require('userdatum').permit(:firstname, :lastname, :mobile, :emailid, :address))
        flash[:success] = 'Profile successfully updated!'
        updateFlag = true
      else
        flash.now[:error] = 'Profile - User data update failed'
        updateFlag = false
        #render :edit, status: :unprocessable_entity
      end
    end

    if params[:user_vitals_and_preference]
      if @uservitals.update(params.require('user_vitals_and_preference').permit(:gender, :age, :height, :weight, :weighttobe))
        flash[:success] = 'Profile successfully updated!'
        updateFlag = true
      else
        flash.now[:error] = 'Profile - user vitals update failed'
        updateFlag = false
        #render :edit, status: :unprocessable_entity
      end
    end

    if updateFlag
      redirect_to curated_salads_path
    else
      render  :profile
    end
end
end
