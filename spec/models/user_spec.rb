require 'rails_helper'


RSpec.describe User, :type => :model do 
   context "When testing the User" do 
      it "should return the name when we call the name method" do 
         user = User.new
         user.name = "Hello"
         expect(user.name).to eq "Hello"
      end
   end
end


 RSpec.describe User, type: :model do    
    it { should have_secure_password }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should have_many(:items) }
 end

 feature 'Creating user' do  
  scenario 'can create a User' do
    # 1. go to root where will be button to Add New Book:
    visit '/'
    # 2. click on Add New Book button
    click_link 'Sign_up'
    # 3. Fill form - add title
    fill_in 'user_name', with: 'Hello'
    fill_in 'user_email', with: 'hello@hotmail.com'
    fill_in 'user_password', with: 'hello' 
    # 4. Click on submit form button
    click_button 'Edit Profile'
    # 5. Then we should be redirected to show page with book details (book title)
    expect(page).to have_content('Hello')
  end
end