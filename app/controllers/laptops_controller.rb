class LaptopsController < ApplicationController

  def index
    @pagy, @laptops = pagy(Laptop.all)
  end
  def show
    @laptop=Laptop.find(params[:id])
    @brands=Brand.all
    @order_item=current_order.order_items.new
    @relates=Laptop.relate(@laptop.brand).last(4)
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
  private
  def laptop_params
    params.require(:laptop).permit(:name, :descripetion, :price,:image1,:image2,:image3,:ram,:monitor,:weight,:brand_id,:quantity)
  end
end
