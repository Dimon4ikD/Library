class AuthorsController < ApplicationController
  # before_action :check_authentication, except: :index
  before_action :manager_permission, except: [:index, :show]
  before_action :set_author, only: [:show, :edit, :update, :destroy]


  def index
    respond_to do |format|
      format.html do
        @authors = Author.ordering.page(params[:page])
      end
      format.json do
        @authors = Author.search(params[:q]).all
        render json: @authors
      end
    end


  end


  def show
  end


  def new
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    else
      @author = Author.new
    end
  end

  def edit
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end
  end


  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: 'Персона создана.'
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'Персона изменена.'
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      redirect_to authors_url, notice: 'Персона удалена.'
    else
      flash[:danger]='Удаление персоны невозможно'
      redirect_to @author
    end
  end

  private

  def set_author
    @author = Author.full.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :birthday, :avatar)
  end

  def manager_permission
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end
  end
end
