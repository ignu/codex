require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentsController do
  describe "create with valid attributes" do
    before(:each) do
      comment = mock_model(Comment)
      comments = mock_model(Array)
      post    = mock_model(Post)
      post.should_receive(:comments).and_return(comments)
      comments.should_receive(:build).with(hash_including(:body => 'ok')).and_return(comment)
      
      Post.should_receive(:find).with('1').and_return(post)
      comment.should_receive(:save!)
      
      post(:create, {:comment => {:body => 'ok'}, :post_id => 1})
    end
    
    it { should assign_to(:comment)     }
    it { should assign_to(:post)        }
    it { should respond_with(:redirect) }
    
  end
end

describe CommentsController, 'routing' do
  it "connects POST /posts/:post_id/comments to create" do
    params_from(:post, '/posts/22/comments').should == {:controller => 'comments', :action => 'create', :post_id => '22'}
  end
end