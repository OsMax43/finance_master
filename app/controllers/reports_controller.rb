class ReportsController < ApplicationController
  before_action :report_params

  def index
  end
    
  def report_by_category
    if @cat == ""
      @operations = Operation.where("otype = ? ", @otype)
      .where("odate BETWEEN ? AND ? ", @s_date, @e_date)
      .group(:category_id).sum(:amount).map do |key, value|
                                        [Category.find(key).name, value]
                                        end
     
     else
      @operations = Operation.where("otype = ? AND category_id = ? ", @otype, @cat)
      .where("odate BETWEEN ? AND ? ", @s_date, @e_date)
      .group(:category_id).sum(:amount).map do |key, value|
                                        [Category.find(key).name, value]
                                        end
    end
    @cat = @operations.map {|e| e[0] }
    @amount = @operations.map {|e| e[1] }
  end

  def report_by_dates
    
    if @cat == ""
      @operations = Operation.where("otype = ? ", @otype).where("odate BETWEEN ? AND ? ", @s_date, @e_date)
      .group(:odate).sum(:amount)
    else
      @operations = Operation.where("otype = ? AND category_id = ? ", @otype, @cat).where("odate BETWEEN ? AND ? ", @s_date, @e_date)
      .group(:odate).sum(:amount)
    end
    @dat = @operations.map {|e| e[0].strftime('%d.%m.%Y') }
    @amount = @operations.map {|e| e[1] }
  end
 
  private

  def report_params
    @s_date = params[:s_date]
    @e_date = params[:e_date]
    @otype = params[:otype]
    @cat = params[:category_id]
  end

end