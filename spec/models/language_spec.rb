require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Language do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:style).of_type(:string) }
end