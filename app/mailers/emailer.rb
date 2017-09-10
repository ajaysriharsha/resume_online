class Emailer < ActionMailer::Base
  default from: "from@example.com"
  
  def signup_confirmation(user)
	  @name = user.first_name
	  @email = user.email
	  mail(:to=>user.email,:subject=>"Welcome - Your account has been activated!")
  end
end
