class ProfileController < ApplicationController
  def edit_profile
	  @user = User.find(session[:user])
	  if request.post?
		  @user.update(user_params)
		  flash[:notice]="Profile Updated"
		  redirect_to :action=>"edit_profile"
	  else
		  render :action=>"edit_profile"
	  end
  end
  
def user_params
      params.require(:user).permit(:first_name,:last_name,:profile_image,:data_of_birth,:mobile)
 end

end
