class PagesController < ApplicationController
  def index
    current_date = Date.today
    month_start = current_date.beginning_of_month
    @outgo = Operation.outgo(current_date.to_datetime, month_start.to_datetime)
    @income = Operation.income(current_date.to_datetime, month_start.to_datetime)
  end
end