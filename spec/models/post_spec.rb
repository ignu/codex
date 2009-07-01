require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do

   it { should have_db_column(:title).of_type(:string) }
   it { should have_db_column(:body).of_type(:text)}
   it { should validate_presence_of(:title) }
   it { should validate_presence_of(:body)  }
   it { should validate_presence_of(:language)  }   
   it { should have_many(:comments)}
   it { should belong_to(:language) }
   it { should belong_to(:user) }

  describe "when setting the language" do

    before(:each) do
      @post = Post.new
      @post.language_name = "Ruby";  
    end

    it "should load or create the language by name"  do
      @post.language.should == Language.find_by_name("Ruby")
    end

  end

end