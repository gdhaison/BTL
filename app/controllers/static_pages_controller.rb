class StaticPagesController < ApplicationController
    def home
      @laptops=Laptop.all
    end
end
