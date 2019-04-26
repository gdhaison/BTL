class StaticPagesController < ApplicationController
    def home
        @laptops=Laptop.last(4)
        @brands=Brand.all
      
    end
    def Dell
      @laptops=Laptop.find_by company: "Dell"
    end
end
