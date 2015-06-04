class User < ActiveRecord::Base
  has_secure_password
  before_validation :set_default_role
  cattr_reader :roles
  has_many :book_orders, dependent: :nullify

  @@roles=%w(Пользователь Администратор)

  validates :name, presence: true, length: {minimum: 2, maximum: 255}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :role, presence: true, inclusion: {in: 0...@@roles.size}
  validates :password, length: {minimum: 6, if: 'password.present?'}, presence: {on: :create}, :confirmation => true
  validates :phone, presence: true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
  validates :address, presence: true




  scope :ordering,->{book_order(:name)}

  def set_default_role
    self.role||=0
  end

  def role_name
    role && @@roles[role]
  end

  def force_authenticate!(controller)
    controller.session[:user_id]=id
  end

  def admin?
    role==1
  end


  def moderator?
    role==1 || administrator?
  end
  def administrator?
    role==2
  end
  def user?
    role==0
  end



end