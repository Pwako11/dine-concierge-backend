class UsersController < ApplicationController

    def index
        render json: User.all
    end 
    
    def show
        user = set_user
        if user
            render json: user
        else
            render json: {error: "Please enter a valid user name and email"}
        end 
    end 

    def create 
        user = User.new(user_params)

        if user.save
            render json: {user: user, message: "Created Successfully"}
        end 
    end 

    private

    def set_user
        user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :email)
    end 
     
end