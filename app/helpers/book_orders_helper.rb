module BookOrdersHelper

  def select_user(user, selected = nil)
    select_tag(user, options_for_select(
                     User.book_order('email').load.map{ |x| [x.email, x.id] } + [['', nil]], [selected]))
  end

end
