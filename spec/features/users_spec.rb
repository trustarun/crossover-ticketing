require 'rails_helper'
RSpec.feature 'Users', type: :feature do
  before :each do
    Capybara.ignore_hidden_elements = false
    @user = create(:user)
    @user1 = create(:user1)
    @user2 = create(:user2)   
  end

  describe '#User' do
    # User lands on different page after login depending on user type
    context 'Login' do
      before(:each) do
        visit new_user_session_path
      end

      it "user should able to login" do
        find("#user_email").set("trust@yahoo.co.in")
        find("#user_password").set("happyarun")
        find("#login_user").click
        expect(page).to have_content('Signed in successfully.')
      end  

      it "should take customer to my ticket page after login" do
        find("#user_email").set("santosh@gmail.com")
        find("#user_password").set("happyarun")
        find("#login_user").click
        expect(page).to have_content('My Tickets')
      end

      it "should take admin to settings page on login" do
        find("#user_email").set("trust@yahoo.co.in")
        find("#user_password").set("happyarun")
        find("#login_user").click
        expect(page).to have_content("Manage Users")
      end 

    end# login context end

    # different user see different links in nav depending on there user type
    context 'Selective Nav' do
      it "customer will have only 2 links under my account" do
        login_as(@user1, scope: :user)
        visit root_path
        expect(find("ul.dropdown-menu", match: :first)).to have_selector("li", count: 2)
      end

      it "employee will have only 3 links under my account" do
        login_as(@user2, scope: :user)
        visit root_path
        expect(find("ul.dropdown-menu", match: :first)).to have_selector("li", count: 3)
      end

      it "employee will have only 5 links under my account" do
        login_as(@user, scope: :user)
        visit root_path
        expect(find("ul.dropdown-menu", match: :first)).to have_selector("li", count: 4)
      end
    end# Selective Nav context end

    context "Selective Access" do
      it "should not allow non admin to access setting page" do
        login_as(@user1, scope: :user)
        visit admin_settings_path
        expect(page).to have_content("you are not authorized to access this action")
      end
    end #Selective Access end

  end# describe block end
end#feature block end
