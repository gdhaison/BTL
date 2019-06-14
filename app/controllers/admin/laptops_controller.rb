class Admin::LaptopsController < ApplicationController
    layout "admin/application"
    def index
      @pagy, @laptops = pagy(Laptop.all)
    end
    def new
        @laptop=Laptop.new
        @brands=Brand.all
    end
    def create
        @laptop=Laptop.new(laptop_params)
        if @laptop.save
          redirect_to new_admin_laptop_path
          flash[:success] = "Create success"
        else
          flash.now[:danger]="false"
          redirect_to new_admin_laptop_path
        end
    end
    def edit
      @laptop = Laptop.find(params[:id])
    end
    def update
      @laptop = Laptop.find(params[:id])
      if @laptop.update_attributes(laptop_params)
        flash[:success] = "Profile updated"
        redirect_to admin_laptops_path
      else
        render 'edit'
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
