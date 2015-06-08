module LineItemsHelper

  def add_quantity
    self.quantity+=1
    self.save
  end

  # def d_amount(book)
  #   @book=book
  #   self.amount-=1
  #   self.save
  # end

end