class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.page(params[:page])
    # data = open(params[:file])
    # send_data data, :filename => params[:document]
  end

  # GET /books/1
  # GET /books/1.json
  def show

    def pdf
      pdf_filename = File.join(Rails.root, "app/assets/docs/doc1.pdf")
      send_file(pdf_filename, :filename => "your_document.pdf", :type => "application/pdf")
    end

  end

  # GET /books/new
  def new
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    else
      @book = Book.new
    end
  end

  # GET /books/1/edit
  def edit
    if !@current_user.try(:admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.document = params[:book][:document]
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end


  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Книга успешно изменена.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Книга успешно удалена.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def manager_permission
      render_error unless Book.manage?(@current_user)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :amount, :year, :author_id, :pages_amount, :genre_id, :isbn, :udc, :lbc, :image, :description, :price, :document)
    end
end
