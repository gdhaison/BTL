class Admin::MicropostsController < ApplicationController
    layout "admin/application"

    def index
        @user= current_user
        @pagy, @microposts = pagy(Micropost.all)
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
        params.permit(:title,:content,:user_id,:image2)
      end
end
