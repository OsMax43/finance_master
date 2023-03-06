class PagesController < ApplicationController
  def index
    current_date = Date.today
    month_start = current_date.beginning_of_month
    @outgo = Operation.where("odate BETWEEN ? AND ? ", month_start, current_date).where("otype = ? ", "витрата").sum(:amount)
    @income = Operation.where("odate BETWEEN ? AND ? ", month_start, current_date).where("otype = ? ", "доход").sum(:amount)
  end
end