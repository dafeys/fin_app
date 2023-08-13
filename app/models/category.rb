class Category < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy
  validates :name, presence: true, uniqueness:  true
  validates :description, presence: true
end
