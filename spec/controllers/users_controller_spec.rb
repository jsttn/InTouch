require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    
    before(:each) do
      @user = Factory(:user)
    end 
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end
    
    it "should have a profile image" do 
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end 
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => "" }
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end 
      
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com", :password => "password", :password_confirmation => "password" }
      end 
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end 
      it "should have a welcome message" do
              post :create, :user => @attr
              flash[:success].should =~ /Welcome to InTouch/i
      end
    end
  end 
end 