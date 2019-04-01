class Admin::UsersController < ApplicationController
    layout "admin/application"
    def index
        @users = User.paginate(page: params[:page], :per_page => 15)
    end
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_users_path
    end
end
