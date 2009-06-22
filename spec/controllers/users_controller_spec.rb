require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  describe "new" do

    before(:each) do
      @user= mock_model(User)
      User.should_receive(:new).and_return(@user)
      get :new
    end

    it { should assign_to(:user)        }
    it { should render_template(:new)   }
    it { should respond_with(:success)  }

  end

  describe "create, with valid parameters" do

    before(:each) do
      @params = { :first_name => "len", :last_name=>"smith", :password => "test123", :password_confirmation => "test123",
                                :email => "ignusmith@gmail.com", :login=>"ignu"}
      @user = mock_model(User)
      User.should_receive(:new).with(hash_including(@params)).and_return(@user)
      @user.should_receive(:save!)
      post(:create, :user => @params)
    end

    it { should assign_to(:user)        }
    it { should render_template(:create)   }
    it { should respond_with(:success)  }
  end

  describe "create, with invalid parameters" do

    before(:each) do
      @params = {}
      @user = mock_model(User)
      User.should_receive(:new).with(hash_including(@params)).and_return(@user)
      @user.should_receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(@user))
      post(:create, :user => @params)
    end
    
    it { should render_template(:new)   }
    it { should respond_with(200)       }

  end

end

describe UsersController, "routing" do

  it "connect /users/new to new" do
    params_from(:get, "/users/new").should == {:controller => 'users', :action => 'new'}
  end

  it "connects posts to /users/create to create" do
    params_from(:post, "/users/create").should == {:controller => 'users', :action => 'create'}    
  end

end