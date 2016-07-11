require 'rails_helper'
RSpec.feature 'Users', type: :feature do
  before :each do
    Capybara.ignore_hidden_elements = false
    @user = create(:user)
    @user1 = create(:user1)
    @user2 = create(:user2)
    @user_type = create(:user_type)
    @user_type1 = create(:user_type1)
    @user_type2 = create(:user_type2)  
  end

  describe '#Admin' do
    # Admin should able to access settings page
    context 'Acess Settings page' do
      before(:each) do
        login_as(@user, scope: :user)
        visit admin_settings_path
      end

      it "should have link to managed page" do
        expect(page).to have_content("Manage Users")
        expect(page).to have_content("Manage Tickets")
      end 
    end# acess settings context end

    # Admin should manage user
    context 'Manage User' do
      before(:each) do
        login_as(@user, scope: :user)
        visit manage_users_admin_settings_path
      end

      it "should list all the users" do
        expect(find("#datatable-editable_users > tbody")).to have_selector("tr", count: 3)
      end

      it "should delete users" do
        expect(find("#datatable-editable_users > tbody")).to have_selector("tr", count: 3)
        find(".delete-row", match: :first).click
        page.driver.browser.switch_to.alert.accept
        sleep 1
        expect(find("#datatable-editable_users > tbody")).to have_selector("tr", count: 2)
      end 

      xit "should assign role to user" do
        find(".user_role_update", match: :first).click
      end

      it "should create user" do
        expect(find("#datatable-editable_users > tbody")).to have_selector("tr", count: 3)
        find("#admin_create_user", match: :first).click
        find("#user_first_name").set("test")
        find("#user_last_name").set("user")
        find("#user_mobile_no").set("9669806453")
        find("#user_email").set("test@gmail.com")
        find("#submit_new_user").click
        sleep 1
        expect(find("#datatable-editable_users > tbody")).to have_selector("tr", count: 4)
      end

    end# manage user context end

  end #feature block ends
 end#feature block end
