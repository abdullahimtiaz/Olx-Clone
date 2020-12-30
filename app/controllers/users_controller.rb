class UsersController < ApplicationController
  def new
  end

  def create
    # byebug
    if User.exists?( email: params[:email] )
      render json:{ "Message": 'Please choose another email'}
      return
    end
    user = User.new(username: params[:username],email: params[:email], password: params[:password], role_id: params[:role_id])
    # user = User.new(user_params)
      if user.save
        render json:  { 'Message': 'Registeration Successful', "Email": user.email, "Id": user.id }

      else
        # puts  user.errors.full_messages.to_sentence
        render json:{'Message': 'Error! Something went wrong'}
      end
  end

  
  def update
    user = User.find(params[:id])
    user.update(user_params_update)
    render json: {'Message': 'Update Successful!', "User": user}
  end

  def user_items
    # item =  Item.where(user_id: params[:user_id], delete_bit: false).all
    user = User.find(params[:user_id]).items.where( delete_bit: false)

    # item = Item.find_by(user_id: params[:user_id], delete_bit: false)
    render json: user

  end

  
  private
 
  # def user_params
  #   params.require(:user).permit(:username, :email, :password, :password_confirmation, :role_id)
  # end

  def user_params_update
    params.require(:user).permit(:username, :role_id)
  end
end
 