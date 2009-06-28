class UserSessionsController < ApplicationController

  def new
    self.render('new')
  end

  # TODO: stolen so not tested. fix some part of this.
  def create
      @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

end
