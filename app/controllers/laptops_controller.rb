class LaptopsController < ApplicationController
  def new
  end
  def show
    @laptop=Laptop.find(params[:id])
  end 
  def list_dell
    @laptops=Laptop.Dell
  end
  def list_asus
    @laptops=Laptop.Asus
  end
  def list_msi
    @laptops=Laptop.MSI
  end
  def create
    @laptop=Laptop.new(laptop_params)
    if @laptop.save
      redirect_to addlaptop_path
      flash[:success] = "Create success"
    else
      flash.now[:danger]="false"
      render "new"
    end
  end
  private
  def laptop_params
    params.permit(:name, :descripton, :price,:company)
  end
end
