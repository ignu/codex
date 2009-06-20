require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
   it { should have_db_column(:title).of_type(:string) }
   it { should have_db_column(:body).of_type(:text)}
   it { should validate_presence_of(:title) }
   it { should validate_presence_of(:body)  }
   it { should validate_presence_of(:language)  }   
   it { should have_many(:comments)}
   it { should belong_to(:language) }
end
