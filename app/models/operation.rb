class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :odate, presence: true
  validates :otype, presence: true
end
