require 'rails_helper'

# bin/rails generate rspec:model user

RSpec.describe User, type: :model do
  describe 'Validations' do
    # correct params passed, save
    it "should save successfully with correct username and password" do
      @user = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      expect(@user.save).to eq(true)
    end

    # incorrect params passed, can't save
    it "should not save successfully without password_confirmation" do
      @user = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'passwooord'
      )
      expect(@user.save).to eq(false)
    end

    it "two users should not have the same email" do
      @user1 = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      @user2 = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      expect(@user1.save).to eq(true)
      expect(@user2.save).to eq(false)
    end

    it "two users should not have the same email, case-sensitive" do
      @user1 = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      @user2 = User.new(
        name:'Test Case',
        email:'teST@gmail.COM',
        password:'password',
        password_confirmation:'password'
      )
      expect(@user1.save).to eq(true)
      expect(@user2.save).to eq(false)
    end

    it "The password must have a minimum length of 8 characters when a user account is being created" do
      @user1 = User.new(
        name:'Test Case',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      @user2 = User.new(
        name:'Test CaseTwo',
        email:'test2@gmail.com',
        password:'password',
        password_confirmation:'passw'
      )
      expect(@user1.save).to eq(true)
      expect(@user2.save).to eq(false)
    end

    it "Returns an instance of the user (if successfully authenticated), or nil (otherwise)" do
      @user = User.new(
        name:'Test Person',
        email:'test@gmail.com',
        password:'password',
        password_confirmation:'password'
      )
      @user.save
      @user2 = User.authenticate_with_credentials('test@gmail.com', 'password')
      @user3 = User.authenticate_with_credentials('test@gmail.com', 'passwo00rd')
      expect(@user).to be == @user2
      expect(@user3).to eq(nil)
    end

    it "Extra spaces around email will still allow user authentication" do
      @user2 = User.authenticate_with_credentials(' test@gmail.com ', 'password')
      expect(@user2).to be == @user2
    end

    it "Email authentication is not case-sensitive for existing user" do
      @user2 = User.authenticate_with_credentials('test@gmail.COM', 'password')
      expect(@user2).to be == @user2
    end  

  end  
end
