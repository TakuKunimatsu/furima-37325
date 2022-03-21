class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,            presence: true
  validates :info,            presence: true
  validates :category_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled
end
