class UserSessionsController < ApplicationController

  def new
    self.render('new')
  end

  # TODO: stolen so not tested. fix some part of this.
  def create
      @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default "/"
    else
      flash[:notice] = "Invalid password!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default "/"
  end

end
