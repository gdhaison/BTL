class Admin::LaptopsController < ApplicationController
    layout "admin/application"
    def index
      @pagy, @laptops = pagy(Laptop.all)
    end
    def new
        @laptop=Laptop.new
      end
    def create
        @laptop=Laptop.new(laptop_params)
        if @laptop.save
          redirect_to new_admin_laptop_path
          flash[:success] = "Create success"
        else
          flash.now[:danger]="false"
          render "new"
        end
    end
    def destroy
        Laptop.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to admin_laptops_path
    end
    private
  def laptop_params
    params.require(:laptop).permit(:name, :descripetion, :price,:image1,:image2,:image3,:ram,:monitor,:weight,:brand_id)
  end
end
