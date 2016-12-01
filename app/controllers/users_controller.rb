class UsersController < ApplicationController

  before_action :get_user, only: [:edit, :update, :destroy, :edit_password]
  before_action :signed_in_user, only: [ :new, :create, :edit, :update, :all_user, :destroy, :edit_password]
  before_action :absolute_admin, only: [:new, :create, :destroy]

  def new
    @user = User.new
    render layout: "admin"
  end

  def create
    @user = User.new(params_user)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    render layout: "admin"
  end

  def all_user
    @users = User.all.order('created_at desc')
    render layout: "admin"
  end


  def edit_password
    render layout: "admin"
  end

  def update
    if @user.update(params_user)
      redirect_to dashboard_url, success: "Accout have updated"
    else
      redirect_to edit_user_path(current_user), danger: "please check all fields"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to all_user_url
  end

  private

  def absolute_admin
    redirect_to dashboard_url if !current_user.god_like?
  end

  def get_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation, :profile, :god_like)
  end
end
