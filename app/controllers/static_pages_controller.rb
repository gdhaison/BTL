class StaticPagesController < ApplicationController
    def home
        @laptops=Laptop.last(9)
      
    end
    def Dell
      @laptops=Laptop.find_by company: "Dell"
    end
end
