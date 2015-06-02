class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book_exemplar

end
