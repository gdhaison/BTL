class LaptopsController < ApplicationController
  def new
  end
  def show
    @laptop=Laptop.find(params[:id])
  end 
  def listDell
    @laptops=Laptop.where(company: "Dell")
  end
end
