module BooksHelper

  # def d_amount(book)
  #   @book=book
  #   self.amount-=1
  #   self.save
  # end
  require 'pdf-reader'
  require 'open-uri'
  def read_book
    io     = open('app/assets/docs/doc1.pdf')
    reader = PDF::Reader.new(io)
    puts reader.info
  end

  def download_pdf
    book = Book.find(params[:id])
    send_data book.document,
              filename: "#{book.name}.pdf",
              type: "application/pdf"
  end


end
