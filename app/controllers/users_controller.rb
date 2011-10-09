class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      # flash[:success] = "Welcome to the sample app!"
      sign_in @user
      redirect_to @user, :flash => { :success => "welcome to the sample app!"}
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
end
