class LaptopController < ApplicationController
  def new
  end
  def index
    @laptops = Laptop.paginate(page: params[:page], :per_page => 15)
  end
end
