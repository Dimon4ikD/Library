class BookOrderMailer < ApplicationMailer
  default from: "noreply@mail.msiu.ru"
  def info_email(book_order)
    @book_order = book_order
    mail(to: @book_order.user.email, subject: "Заказ №#{@book_order.id}")
  end
end

