class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    # @current_user.try.admin?
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    # if @current_user.blank?
    #   if !@current_user.admin?
    #     redirect_to @current_user, notice:"Вы не админинстратор"
    #   end
    # end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      if @current_user
        redirect_to @user, notice: 'Пользователь создан.'
      else
        @user.force_authenticate!(self)
        redirect_to root_path, notice: 'Регистрация завершена.'
      end
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Пользователь изменен.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone, :address, :role, :name)
    end
end
