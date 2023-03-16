class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :odate, presence: true
  validates :otype, presence: true

  
  def self.by_category(otype, s_date, e_date)
    where("otype = ? AND odate BETWEEN ? AND ? ", otype, s_date, e_date)
    .group(:category_id).sum(:amount).map do |key, value|
                                        [Category.find(key).name, value]
                                        end
  end

  def self.by_category_full(otype, cat, s_date, e_date )
    where("otype = ? AND category_id = ? AND odate BETWEEN ? AND ? ", otype, cat, s_date, e_date)
    .group(:category_id).sum(:amount).map do |key, value|
                                      [Category.find(key).name, value]
                                      end
  end


  def self.by_dates(otype, s_date, e_date)
    where("otype = ? AND odate BETWEEN ? AND ? ", otype, s_date, e_date)
    .group(:odate).sum(:amount)
  end

  def self.by_dates_cat(otype, cat, s_date, e_date)
    where("otype = ? AND category_id = ? AND odate BETWEEN ? AND ? ", otype, cat, s_date, e_date)
    .group(:odate).sum(:amount)
  end
end
