class StaticPagesController < ApplicationController
    def home
      @laptops=Laptop.all
    end
    def Dell
      @laptops=Laptop.find_by company: "Dell"
    end
end
