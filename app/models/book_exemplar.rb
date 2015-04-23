class BookExemplar < ActiveRecord::Base
  belongs_to :book
  belongs_to :place
end
