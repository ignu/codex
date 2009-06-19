require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  it { should have_db_column(:body).of_type(:text) }  
  it { should validate_presence_of(:body)  }
  it { should belong_to(:post)}
end
