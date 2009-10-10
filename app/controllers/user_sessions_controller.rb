class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to :back if response['Referer']
      redirect_to :controller => :later_links, :action => 'largest'
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy if @user_session
    flash[:notice] = "Successfully logged out."
    redirect_to '/'
  end
end
