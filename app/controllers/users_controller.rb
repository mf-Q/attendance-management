class UsersController < ApplicationController

def index
  @users = User.all.order("id") 
end

def new
  @user = User.new
end

def create
  @user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password])
  @user.save
  redirect_to("/")
  
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
     @user.save
     redirect_to("/users/show")
end

def show
  @users = User.all.order("id") 
end

def destroy
  user = User.find(params[:id])
  user.destroy
  redirect_to("/users/show")
end

private
def user_params
  params.require(:user).permit(:name, :email, :password)
end

end
