require 'rails_helper'


RSpec.describe "Users", :type => :request do
  describe "GET /users" do
=begin
    it "should be sign up and sign in" do  		
    	visit snippets_path
  		page.should have_content 'Sign Up'
  		page.should have_content 'Sign In'  		
  	end


  	it "emails user when requesting password reset" do
			@user = FactoryGirl.create(:user)
			visit new_user_password_path
			#click_link "Send me reset password instructions"
			find("Send me reset password instructions").click_link 'Send me reset password instructions'

			fill_in "Email", :with => user.email

			click_link "Reset password"

		end  		
   	
 
   	it "should be possible to sign up" do
  		visit snippets_path
  		page.should have_content 'Sign Up'
  		page.should have_content 'Sign In'
  					
  		click_button 'Sign Up'

  		current_path.should == new_user_registration_path

  		fill_in 'Email', 								 :with => 'testmail@mail.com'
    	fill_in 'Password', 						 :with => 'password'
    	fill_in 'Password confirmation', :with => 'password'

    	click_button 'Sign up'

    	current_path.should == snippets_path

    	page.should have_content 'Signed in as '+'testmail@mail.com' 
    	page.should have_content 'Sign Out' 
  	end
=end
  end
end
