class ReportsController < ApplicationController
  def index
  end

  def report
    if params[:report_type] == "category"
      report_by_category
      render 'report_by_category'
    elsif params[:report_type] == "dates"
      report_by_dates
      render 'report_by_dates'
    end
  end

  def report_by_category
    date_range = parse_date_range

    category_totals = Category.joins(:operations)
                              .where(operations: { odate: date_range })
                              .group(:id)
                              .pluck(:name, 'SUM(operations.amount) AS total_cost')
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
                           .where(operations: { odate: date_range }) 
                           .pluck("DATE(odate) AS day", "SUM(amount) AS total_cost")
                           #.select("DATE(odate) AS day, SUM(amount) AS total_cost")

    @days, @days_costs = daily_costs.transpose
  end

  private

  def parse_date_range
    date_start = Date.parse(params[:date_start]).beginning_of_day
    date_end = Date.parse(params[:date_end]).end_of_day
    date_start..date_end
  end

end
