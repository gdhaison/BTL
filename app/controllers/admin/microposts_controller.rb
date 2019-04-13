class Admin::MicropostsController < ApplicationController
    layout "admin/application"

    def index
        @user= current_user
        @microposts = @user.microposts.paginate(page: params[:page])
    end
    def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to admin_microposts_path
      else
        render 'new'
      end
    end
  
    def destroy
    end
  
    private
  
      def micropost_params
        params.permit(:content)
      end
end
