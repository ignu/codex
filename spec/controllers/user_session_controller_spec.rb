require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do

  before(:each) do
    get :new 
  end
  
  describe "when creating a new session" do
    it { should render_template('new') }
    it { should respond_with(:success) }
  end
  
end

describe UserSessionsController, "routing" do

  it "connects /login to new" do
    params_from(:get, "/login").should == {:controller => 'user_sessions', :action => 'new'}
  end

  it "connects /login to new" do
    params_from(:post, "/login").should == {:controller => 'user_sessions', :action => 'create'}
  end

it "connects /logout to destroy" do
    params_from(:post, "/logout").should == {:controller => 'user_sessions', :action => 'destroy'}
  end

end