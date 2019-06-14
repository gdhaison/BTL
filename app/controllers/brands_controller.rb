class BrandsController < ApplicationController
  def index
    @brands=Brand.all
  end
  def new
    @brand=Brand.new
  end
  def show
    @brand=Brand.find(params[:id])
    @laptops=@brand.laptops
  end
  def create 
    @brand=Brand.new(brand_params)
    if @brand.save
      redirect_to new_admin_brand_path
      flash[:success]="Create Success"
    else
      flash[:success]="Fail"
      render "new"
    end
  end
  def destroy
    Brand.find(params[:id]).destroy
    flash[:success]="Delete success"
    redirect_to admin_brands_path
  end
  private 
  def brand_params
    params.require(:brand).permit(:name)
  end
end
