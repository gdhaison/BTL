class ApplicationController < ActionController::Base
    before_action :set_locale
    protect_from_forgery with: :exception
    include SessionsHelper
    def set_locale
        locale = params[:locale].to_s.strip.to_sym
        I18n.locale = I18n.available_locales.include?(locale) ?
          locale : I18n.default_locale
    end

    def current_cart
        if !session[:cart_id].nil?
          Cart.find(session[:cart_id])
        else
          Cart.create
        end
      end
      def cart_params
        params.require(:cart).permit(:Cart_id)
      end
      def cart_item_params
        params.require(:cart).permit(:CartItem_id, :owner_id, :owner_type, :quantity, :item_id, :item_type, :price_cent, :price_currency)
      end
end
