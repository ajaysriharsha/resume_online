class PasswordController < ApplicationController
  def forget_password
		if request.post?
			@user = User.find_by_email(params[:user][:email])
			if @user
				new_password = [*(1..9),*('a'..'z')].sample(8).join			  
				@user.update(:password=>new_password)
				puts "======"
				puts new_password
				#Notifier.forget_password(@user,new_password).deliver
				flash[:notice] = "A new password has been sent your email"
				redirect_to controller: "account", action: "login"
			else
				flash[:notice]="Invalid Email.Please enter correct email"
				render action: "forget_password"
			end		
		end	  
  end

  def reset_password
	@user = User.find(session[:user])		
		if request.post?			
			if @user
				@user.update(:password=>params[:user][:password])
				#Notifier.reset_password(@user).deliver
				flash[:notice] = "Your password has been reset"
				redirect_to controller: "account",action: "index"			
			else
				flash[:notice] = "Please enter valid password"
				render action: "reset_password"				
			end
		end
  end
end
