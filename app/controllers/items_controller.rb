class ItemsController < ApplicationController
  # include UserHelper
    before_action :is_logged_in?, only: [:create, :update]
    def index
        # items = Item.all
        items = Item.where('quantity  >= 1')

        render json: items
    end

    def create
        item = Item.new(item_params)
        # byebug
        item.user_id =  session[:current_user_id]
        
        if item.save
          render json: item, status: :created
        else
          render json: item.errors.messages, status: :unprocessable_entity
        end
      end

      def show
        item = Item.find(params[:id])
        render json: item
      end

      def update
        # puts params.inspect 
        item = Item.find(params[:id])
        item.update(item_params_update)
        render json: {'Message': 'Update Successful!', "Item": item}
      end

      def destroy 
        item = Item.find(params[:id])
        # params[:user_id]
        item.update(delete_bit: true)
        render json: {'Message': 'Delete Successful!'}
      end

      # def purchase
      #   item = Item.find(params[:item_id])
      #   item.update_attribute(:purchaser_id, params[:user_id])
      #   render json: item
      # end
    
    private

    def item_params
      # params.require(:item).permit(:category, :description, :user_id)
      params.require(:item).permit(:category, :description)
    end
    def item_params_update
      params.require(:item).permit(:category, :description)
    end

  end
