# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_user, only: [:update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    actable_id = lookup_actable_id(params[:user][:actable_type])
    @user = nil
    if actable_id == 1
      @expert = Expert.new(email: params[:user][:email], status: params[:user][:status], username: params[:user][:username], password: params[:user][:password])
      @user = @expert
    else
      @novice = Novice.new(email: params[:user][:email], status: params[:user][:status], username: params[:user][:username], password: params[:user][:password])
      @user = @novice
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
    # super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    @user.update(status: lookup(params[:Status].to_i), username: params[:user][:username], email: params[:user][:email])
    render "edit_status"
    # super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def edit_status
    @user = User.find_by_id(params[:id])
    render "edit_status"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :status, :username, :actable_type, :actable_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :status, :username])
  end

  def set_user
    @user = User.find_by_id(params[:user][:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :actable_type, :actable_id, :status)
  end

  def lookup(status)
    {
      "qualified" => 0,
      "not_qualified" => 1,
      "banned" => 2,
    }[status]
  end

  def lookup_actable_id(actable_type)
    {
      "Novice" => 0,
      "Expert" => 1,

    }[actable_type]
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
