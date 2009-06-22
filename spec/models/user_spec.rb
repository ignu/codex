require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  # todo: not sure why this matcher isn't found it { should_be_authentic }
  it "should be authenicatable" do
    @user = User.new
    @user.respond_to?(:password=).should be_true
    @user.respond_to?(:valid_password?).should be_true

  end

  it { should have_db_column(:login).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:crypted_password).of_type(:string) }
  it { should have_db_column(:password_salt).of_type(:string) }
  it { should have_db_column(:persistence_token).of_type(:string) }
  it { should have_db_column(:single_access_token).of_type(:string) }
  it { should have_db_column(:perishable_token).of_type(:string) }
end