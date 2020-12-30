class ShoppingCartsController < ApplicationController
    before_action :extract_shopping_cart

    def create
        # if params[:cart_id]
            # @cart = ShoppingCartItem.find_by(owner_id: params[:cart_id])
        @item = Item.find(params[:item_id])
            # puts "USER #{session.to_hash}"
            # puts "SHOPPING #{@shopping_cart.id}"
        @shopping_cart.add(@item, @item.price)
            # puts session
        # end

        render json: @shopping_cart
        
        # byebug
        # puts @shopping_cart
    end
    
    private
    
    def extract_shopping_cart
        # shopping_cart_id = session[:shopping_cart_id]
        @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(session[:shopping_cart_id]) : ShoppingCart.create
    # byebug
    # @shopping_cart.user_id = @user.id
        session[:shopping_cart_id] = @shopping_cart.id
    end

    def shopping_cart_params
        params.require(:shopping_cart).permit()
    
    end
    
end
