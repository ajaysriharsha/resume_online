class AccountController < ApplicationController
  def index
  end
  def signup
	@user = User.new
	if request.post?
		@user = User.new(user_params)
		if @user.save
			flash[:notice]="Your account has been created"
			Emailer.signup_confirmation(@user).deliver
			redirect_to action: "login"
		else
			render action: "signup"
		end
	end	
  end

  def login
	  if request.post?
		@user = User.authenticate(params[:user][:email],params[:user][:password])
		if @user
			session[:user]=@user.id
			flash[:notice]="You are logged in!"
			redirect_to :action=>:index
			
		else
			flash[:notice]="Invlaid Username/Password"
			render :action=>:login
		end
	end
end

def logout
	session[:user]=nil
	flash[:notice]="You are logged out"
	redirect_to :action=>:login
end
  
  private
   def user_params
      params.require(:user).permit(:first_name,:last_name,:hashed_password,:password,:email,:date_of_birth,:mobile,:password_confirmation)
 end
end
