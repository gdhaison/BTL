class BrandController < ApplicationController
  def index
    @laptops=Laptop.brand(params[:id]);
  end
  def show
    @laptops=Laptop.brand(params[:id]);
  end
end
