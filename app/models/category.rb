class Category < ApplicationRecord
  belongs_to :user

  has_many :payments, dependent: :destroy

  has_one_attached :icon

  validates :name, presence: true
end
