class Admin::SearchController < ApplicationController
  def index
    @laptops=Laptop.search(params[:term]).sorted
  end
end
