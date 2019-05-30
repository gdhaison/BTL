class Admin::UsersController < ApplicationController
    layout "admin/application"
    def index
        @pagy, @users = pagy(User.all)
    end
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_users_path
    end
end
