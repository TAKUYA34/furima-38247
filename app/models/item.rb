class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :sender
  belongs_to :shipping

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image

  with_options presence: true, format: {with: /\A[0-9]+\Z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
              presence: {message: "can't be blank"}
  end

  validates :product,            presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :situation_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :sender_id,          presence: true
  validates :shipping_id,        presence: true
  validates :image,              presence: true
end
