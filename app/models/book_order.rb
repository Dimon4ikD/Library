
class BookOrder < ActiveRecord::Base

  after_create :send_mail

  belongs_to :cart
  belongs_to :user
  # belongs_to :book_exemplar
  has_many :line_items, dependent: :destroy
  scope :ordering, -> {book_order(created_at: :desc)}

  STATUSES=%w(Оформлен Подтверждён Отменён Доставляется Завершён) #0 1 2 3 4
  validates :cart, presence: true
  validates :user, presence: true
  # validates :email, presence: true


  validate :check_cart

  def check_cart
    if cart && cart.line_items.blank?
      errors.add(:cart, "Корзина пуста!")
    end
  end
  def add_lineitems(cart)
    line_items=[]
    cart.line_items.each do |l_i|
      l_i.cart_id=nil
      line_items << l_i
    end
  end
  def send_mail
    BookOrderMailer.info_email(self).deliver_later
    true
  end

end
