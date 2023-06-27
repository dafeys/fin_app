class Operation < ApplicationRecord
  belongs_to :category
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  validates :odate, :description, presence: true
end
