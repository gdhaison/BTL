class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def method_without_layout
    render layout: false
  end
  def index
    @pagy, @users = pagy(User.all)
  end
  def new
    @user=User.new
  end
  def show
    @user = User.find(params[:id])

  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the LaptopHS!"
      redirect_to @user
    else
      render "new";
    end
  end

  def edit
    @user=User.find(params[:id])
  end
  def update
    @user = User.find params[:id]

    if @user.update_attributes user_params
      flash[:success] = "updated"
      redirect_to @user
    else
      flash[:danger] = "notice_show"
      render "edit"
   end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
    redirect_to(root_url) unless current_user?(@user)
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  def search
    @users_search=User.find_by(params[:name])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
