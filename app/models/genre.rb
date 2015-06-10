class Genre < ActiveRecord::Base
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :ordering, -> { order(:name) }

  before_destroy :can_destroy?


  def self.manage?(u)
    u.try(:admin?)
  end

  def can_destroy?
    books.blank?
  end

end
