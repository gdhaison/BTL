class MicropostsController < ApplicationController

    def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
    end
  
    def destroy
      Micropost.find(params[:id]).destroy
      flash[:success] = "Post deleted"
      redirect_to admin_microposts_url
    end
  
    private
  
      def micropost_params
        params.require(:micropost).permit(:content,:image)
      end
end
