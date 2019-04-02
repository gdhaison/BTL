class LaptopsController < ApplicationController
  def show
    @laptop=Laptop.find(params[:id])
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
  private
  def laptop_params
    params.require(:laptop).permit(:name, :descripetion, :price,:image1,:image2,:image3,:ram,:monitor,:weight,:company)
  end
end
