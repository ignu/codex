require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

#module Spec
#  module Rails
#    module Mocks
#      def mock_model
#        raise
#      end
#    end
#  end
#end

describe PostsController do
  describe "show, with valid id" do
    before(:each) do
      post = mock_model(Post)
      comments = mock_model(Array)
      comment  = mock_model(Comment)
      comments.should_receive(:build).and_return(comment)
      Post.should_receive(:find).with("1").and_return(post)
      post.should_receive(:comments).and_return(comments)
      get 'show', {:id => 1}
    end
    
    it { should assign_to(:post)           }
    it { should assign_to(:comment)        }
    it { should render_template('show') }
    it { should respond_with(:success)  }
    
  end
  
  describe "show, with invalid id" do
    before(:each) do
      Post.should_receive(:find).with("1").and_raise(ActiveRecord::RecordNotFound)
      rescue_action_in_public!
      
      get 'show', {:id => 1}
    end
    
    it { should_not assign_to(:post)        }
    it { should_not render_template('show') }
    it { should respond_with(:not_found)    }
    
  end
  
  describe "new" do
    before(:each) do
      post = mock_model(Post)
      Post.should_receive(:new).and_return(post)
      get :new
    end
    
    it { should assign_to(:post)        }
    it { should render_template(:new)   }
    it { should respond_with(:success)  }
  end
  
  describe "create, with valid data" do
    before(:each) do
      @post = mock_model(Post)

      Post.should_receive(:new).with(hash_including(:title => 'this', :body => 'that')).and_return(@post)

      @language = mock_model(Language)
      Language.should_receive(:find_or_create_by_name).with("Ruby").and_return(@language)
      @post.should_receive(:language=).with(@language)
      @post.should_receive(:save!)
      
      post(:create, {:post => {:title => 'this', :body => 'that'}, :language_name => "Ruby"})
    end

    it { should assign_to(:post) }
    it { should respond_with(:redirect) }
    
  end
  
  describe "create, with invalid data" do
    before(:each) do
      @post = mock_model(Post, {:errors => mock('errors', {:full_messages => []}) })
      Post.should_receive(:new).with(hash_including(:body => 'that')).and_return(@post)
      @language = mock_model(Language)
      Language.should_receive(:find_or_create_by_name).with("Ruby").and_return(@language)
      @post.should_receive(:language=).with(@language)
      @post.should_receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(@post))
      post(:create, {:post => {:title => 'this', :body => 'that'}, :language_name => "Ruby"})
    end
    
    it { should assign_to(:post)      }
    #it { should render_template(:new) }
    #it { should respond_with(200)     }
    
  end
end

describe PostsController, "routing" do
  it "connects the root of the site to new" do
    params_from(:get, "/").should == {:controller => 'posts', :action => 'new'}
  end
  
  it "connect /posts/new to new" do 
    params_from(:get, "/posts/new").should == {:controller => 'posts', :action => 'new'}
  end
  
  it "new_post_path should return /posts/new" do
    new_post_path.should == '/posts/new'
  end
end