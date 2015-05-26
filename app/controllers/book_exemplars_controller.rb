class BookExemplarsController < ApplicationController
  before_action :set_book_exemplar, only: [:show, :edit, :update, :destroy]

  # GET /book_exemplars
  # GET /book_exemplars.json
  def index
    @book_exemplars = BookExemplar.all
  end

  # GET /book_exemplars/1
  # GET /book_exemplars/1.json
  def show
  end

  # GET /book_exemplars/new
  def new
    @book_exemplar = BookExemplar.new
  end

  # GET /book_exemplars/1/edit
  def edit
  end

  # POST /book_exemplars
  # POST /book_exemplars.json
  def create
    @book_exemplar = BookExemplar.new(book_exemplar_params)

    respond_to do |format|
      if @book_exemplar.save
        format.html { redirect_to @book_exemplar, notice: 'Book exemplar was successfully created.' }
        format.json { render :show, status: :created, location: @book_exemplar }
      else
        format.html { render :new }
        format.json { render json: @book_exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_exemplars/1
  # PATCH/PUT /book_exemplars/1.json
  def update
    respond_to do |format|
      if @book_exemplar.update(book_exemplar_params)
        format.html { redirect_to @book_exemplar, notice: 'Book exemplar was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_exemplar }
      else
        format.html { render :edit }
        format.json { render json: @book_exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_exemplars/1
  # DELETE /book_exemplars/1.json
  def destroy
    @book_exemplar.destroy
    respond_to do |format|
      format.html { redirect_to book_exemplars_url, notice: 'Book exemplar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_exemplar
      @book_exemplar = BookExemplar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_exemplar_params
      params.require(:book_exemplar).permit(:book_id)
    end
end
