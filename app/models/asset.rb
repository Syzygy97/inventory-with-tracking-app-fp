class Asset < ApplicationRecord
  belongs_to :category
  has_many :markers
  has_one_attached :image
  has_many_attached :pictures

  validates :name, :description, :quantity, :classification, :status, :purchase_date, :price, presence: true
  validates :classification, inclusion: { in: %w[Undeployable Deployable] }

  enum :status, {Available: 0, Deployed: 1}
  enum :classification, {Undeployable: 0, Deployable: 1}

  def image_as_display
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_fit: [400, 400]).processed
  end

  def image_as_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_fit: [200, 200]).processed
  end

end
