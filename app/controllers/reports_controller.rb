class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def report
    case params[:report_type]
    when "category"
      report_by_category
      render 'report_by_category'
    when "dates"
      report_by_dates
      render 'report_by_dates'
    end
  end

  def report_by_category
    date_range = parse_date_range

    category_totals = Category.includes(:operations)
                              .where(user_id: current_user, operations: { odate: date_range })
                              #.where(operations: { odate: date_range })
                              .group(:id)
                              .pluck(:name, 'SUM(operations.amount)')
                              #.select('categories.*, SUM(operations.amount) AS total_cost')
        
    @category_names, @category_costs = category_totals.transpose 

    if @category_costs.kind_of?(Array)
      @total_categories_cost = @category_costs.sum
    else
      @category_costs = ['-']
      @category_names = ['-']
      @total_categories_cost = 0
    end


  end

  def report_by_dates
    date_range = parse_date_range

    daily_costs = Operation.group("DATE(odate)")
                           .includes(:category)
                           .where(category: { user_id: current_user }, odate: date_range)
                           #.where(odate: date_range) 
                           .pluck("DATE(odate)", "SUM(amount)")
                           #.select("DATE(odate) AS day, SUM(amount) AS total_cost")

    #@days, @days_costs = daily_costs.transpose
    @days = daily_costs.map { |data| "#{data[0]}" } # fly.io date format: Wed, 14 Jun 2023
    @days_costs = daily_costs.map { |data| data[1] }
 end

  private

  def parse_date_range
    if params[:date_start] && params[:date_end] && params[:date_start]!='' && params[:date_end]!=''
      date_start = Date.parse(params[:date_start]).beginning_of_day
      date_end = Date.parse(params[:date_end]).end_of_day
    else
      date_start = 30.days.ago.beginning_of_day
      date_end = Time.current.end_of_day
    end

    date_start..date_end
  end

end
