class Author < ActiveRecord::Base

  has_attached_file :avatar, styles: {medium: "250x300>", thumb: "width: 70, hight:70"}


  validates :name, presence: true
  validate :check_birthday
  validates_attachment :avatar, content_type: {content_type: /\Aimage\/.*\z/}


  has_many :books, class_name: 'Book', foreign_key: :author_id

  scope :ordering, -> { (order(:name)) }
  scope :full, -> { includes(books: :genre) }



  def self.manage?(u)
    u.try(:admin?)
  end

  def can_destroy?
    books.blank?
  end

  def age(d=nil)
    d||=Date.today
    return unless birthday
    res=d.year-birthday.year
    res-= 1 if Date.new(d.year, birthday.month, birthday.day) > d
    res
  end

  def human_age(d=nil)
    "#{age(d)} #{RuPropisju.choose_plural(age(d), 'год', 'года', 'лет')}"
  end

  def self.search(q)
    ordering.where("upper(name) like upper(:q) or upper(origin_name) like upper(:q)", q: "%#{q}%")
  end


  private
  def check_birthday
    errors.add(:birthday, :invalid) if birthday && birthday>Date.today
    true
  end
end
