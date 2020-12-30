class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password]) 
            session[:current_user_id] = user.id
            # token = encode_token({user_id: @user.id})
            # render json: {Message: 'Login Successful!', user: @user, token: token}
            render json: {Message: 'Login Successful!', user: user}
            # render json: {'Message': 'Login Successful!'}
        else
            render json: {'Message': 'Invalid Email or Password'
            }
        end
    end
end