require 'spec_helper'

feature 'Accounts' do
  let(:account) { FactoryGirl.build(:account) }
  scenario "creating an account" do
    visit root_url
    click_link 'Account Sign Up'
    fill_in 'Name', :with => account.name
    fill_in 'Email', :with => account.owner.email
    password_field_id = "account_owner_attributes_password"
    fill_in password_field_id, :with=>"password"
    fill_in 'Password confirmation', :with=>"password"
    click_button "Create Account"

    success_message = "Your account has been successfully created."
    success_login_message = "Signed in as #{account.owner.email}"
    page.should have_content(success_message)
    page.should have_content(success_login_message)
  end
end

