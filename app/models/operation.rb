class Operation < ApplicationRecord
  belongs_to :category
  has_one :user, through: :category
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  validates :odate, :description, presence: true

  def format_odate
    self.odate.strftime('%Y-%m-%d %H:%M')
  end
end
