require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do

end

describe UserSessionsController, "routing" do

  it "connect /login to new" do
    params_from(:get, "/login").should == {:controller => 'user_sessions', :action => 'new'}
  end

end