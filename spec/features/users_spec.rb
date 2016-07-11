require 'rails_helper'
RSpec.feature 'Users', type: :feature do
  before :each do
    Capybara.ignore_hidden_elements = false
    @user = create(:user)
    @user1 = create(:user1)
    @user2 = create(:user2)   
    #login_as(@user, scope: :user)
  end

  describe '#User' do
    context 'Login' do
      it "user should able to login" do
        visit new_user_session_path
        find("#user_email").set("trust@yahoo.co.in")
        find("#user_password").set("happyarun")
        find("#login_user").click
        expect(page).to have_content('Signed in successfully.')
      end
      
      
    end# login context end
  end# describe block end
end#feature block end
