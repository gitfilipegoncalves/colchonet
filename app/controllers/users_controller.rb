class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      SignupMailer.confirm_email(@user).deliver
      redirect_to @user,
                  notice: 'Cadastro criado com sucesso!'
    else
           render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Cadastro atualizado com sucesso!'
    else
      render :edit
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:bio, :email, :full_name, :location, :password, :password_confirmation)
    end
end
