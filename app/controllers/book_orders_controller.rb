class BookOrdersController < ApplicationController
  before_action :set_book_order, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :manager_permission, except: [:new, :create]

  # GET /book_order
  # GET /book_order.json
  def index
    if !@current_user.blank?
      if @current_user.role == 0
        @book_orders = BookOrder.where(user_id: @current_user.id).ordering.page(params[:page])
      else
        @book_orders = BookOrder.ordering.page(params[:page])
      end
    end
  end

  # GET /book_order/1
  # GET /book_order/1.json
  def show
  end

  # GET /book_order/new
  def new
    @book_order = BookOrder.new
  end

  # GET /book_order/1/edit
  def edit
  end

  # POST /book_order
  # POST /book_order.json
  def create
    @book_order = BookOrder.new(new_book_order_params)
    @book_order.cart = @cart
    @book_order.user = @current_user
    @book_order.add_lineitems(@cart)
    if @book_order.save
      session.delete(:cart_id)
      redirect_to root_path, notice: 'Заказ оформлен.'
    else
      render :new
    end
  end

  # PATCH/PUT /book_order/1
  # PATCH/PUT /book_order/1.json
  def update
    respond_to do |format|
      if @book_order.update(book_order_params)
        format.html { redirect_to @book_order, notice: 'Заказ изменён.' }
        format.json { render :show, location: @book_order }
      else
        format.html { render :edit }
        format.json { render json: @book_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_order/1
  # DELETE /book_order/1.json
  def destroy
    @book_order.destroy
    respond_to do |format|
      format.html { redirect_to book_orders_url, notice: 'Заказ удалён.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book_order
    @book_order = BookOrder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_order_params
    params.require(:book_order).permit(:cart_id, :user_id, :address, :comment)
  end

  def new_book_order_params
    params.require(:book_order).permit(:address)
  end
end