class UsersController < ApplicationController

    before_action :authorize, only: [:favorite_books]

    def index 
        @users = User.all 
        render json: @users
    end 

    def favorite_books
        user = User.find(@user_id)
        render json: user.books
    end

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: @user
    end 

end
