class Book < ActiveRecord::Base
  has_attached_file :image, styles:{medium: "300x300", thumb:"100x100"}
  has_attached_file :document #, styles: {thumbnail: "60x60"}
  has_many :line_items, dependent: :nullify

  before_destroy :can_destroy?

  validates_attachment :document, content_type: { content_type: "application/pdf" }
  #validates_attachment :document, content_type: {content_type:/\A\//}
  validates_attachment :image, content_type: {content_type: /\Aimage\/.*\z/}

  validates :amount, numericality:{only_integer: true}
  validates :name, presence: true, length: {maximum: 200}
  validates :price, presence: true, numericality:{greater_than: 0}

#  validates :weight, numericality:{only_integer: true, greater_than: 0}, allow_blank: true

  def can_destroy?
    line_items.blank?
  end

  def can_sell?
    amount>0
  end

  # def download
  #   file_name = params["file_id"] + ".pdf" data = open("s3.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/#{file_name}") send_data data.read, :filename => file_name, :type => "application/pdf", :disposition => 'attachment', :stream => 'true', :buffer_size => '4096'
  # end

end
