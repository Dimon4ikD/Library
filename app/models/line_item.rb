class LineItem < ActiveRecord::Base
  belongs_to :Cart
  belongs_to :Book_exemplar

end
