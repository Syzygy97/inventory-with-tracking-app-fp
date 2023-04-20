class Asset < ApplicationRecord
  belongs_to :category
  has_many :markers
  has_one_attached :image
  has_many_attached :pictures

  PURCHASE = "Purchase"
  SELL = "Sell"

  validates :name, :description, :quantity, :classification, :status, :purchase_date, :price, presence: true
  validates :classification, inclusion: { in: %w[Undeployable Deployable] }

  enum :status, {Available: 0, Deployed: 1}
  enum :classification, {Undeployable: 0, Deployable: 1}

  def total_price
    self.price = self.price * quantity
  end

  def create_order current_user
    Order.create(
      :name => name,
      :quantity => quantity,
      :price => total_price,
      :classification => PURCHASE,
      :transaction_date => purchase_date,
      :user_id => current_user.id
    )
  end

  # ACTIVE STORAGE
  def image_as_display
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_fit: [400, 400]).processed
  end

  def image_as_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_fit: [200, 200]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "image_attachment", "image_blob", "markers", "pictures_attachments", "pictures_blobs"]
  end

end
