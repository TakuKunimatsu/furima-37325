class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates :postal_code,     presence: true
  validates :prefecture_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,            presence: true
  validates :addresses,       presence: true
  validates :building
  validates :phone_number,    presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
