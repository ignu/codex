class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new self.params[:user]
    @user.save!
    self.render(:create)
    rescue ActiveRecord::RecordInvalid    
	render('new')
  end

end
