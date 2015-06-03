$('#my_cart').html("<%= escape_javascript upd_cart(@cart) %>");

$(document).trigger "cart:update"
alert "Книга << <%=j @book.name%> >> добавлеа в корзину."