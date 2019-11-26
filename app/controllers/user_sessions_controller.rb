class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:show, :edit, :update, :destroy]


  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, params[:user_session])
    if @session.authenticate
      redirect_to root_path, :notice => t('flash.notice.signed_in')
    else
      render :new
    end
  end

  def destroy
    user_session.destroy
    redirect_to root_path, :notice => t('flash.notice.signed_out')
  end


  private
    def set_user_session
      @session = UserSession.find(params[:id])
    end

    def user_session_params
      params.require(:user_session).permit(:email,:password)
    end

end
