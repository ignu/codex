require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do

  before(:each) do
    get :new 
  end
  
  describe "when creating a new session" do
    it { should render_template('new')    }
    it { should respond_with(:success)     }
  end
  
end

describe UserSessionsController, "routing" do

  it "connect /login to new" do
    params_from(:get, "/login").should == {:controller => 'user_sessions', :action => 'new'}
  end

end