class ReportsController < ApplicationController
  before_action :report_params

  def index
  end
    
  def report_by_category
    if @cat == ""
      @operations = Operation.by_category(params[:otype], params[:s_date].to_datetime, params[:e_date].to_datetime )
    else
      @operations = Operation.by_category_full(params[:otype], params[:category_id], params[:s_date].to_datetime, params[:e_date].to_datetime )
    end
    @cat = @operations.map {|e| e[0] }
    @amount = @operations.map {|e| e[1] }
  end

  def report_by_dates
    if @cat == ""
      @operations = Operation.by_dates(params[:otype], params[:s_date].to_datetime, params[:e_date].to_datetime)
    else
      @operations = Operation.by_dates_cat(params[:otype], params[:category_id], params[:s_date].to_datetime, params[:e_date].to_datetime)
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