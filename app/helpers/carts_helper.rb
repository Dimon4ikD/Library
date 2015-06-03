module CartsHelper
  def show_cart(cart)
    #render 'carts/cart', cart:cart
    if cart.line_items.blank?
      text="Ваша корзина пуста"
      content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
    else

      text="В корзине #{cart.total_line_items} #{Russian.p(cart.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(cart.total_amount)}"

      content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
    end
  end

  def upd_cart(cart)
    "В корзине #{cart.total_line_items} #{Russian.p(cart.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(cart.total_amount)}"
  end
end