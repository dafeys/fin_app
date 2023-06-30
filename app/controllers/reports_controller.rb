class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    category_totals = Category.joins(:operations)
          .group(:id)
          .select('categories.*, SUM(operations.amount) AS total_cost')
    
    data_for_chart = category_totals.map { |category| [category.name, category.total_cost] }
    @category_names = data_for_chart.map { |name| name[0] }
    @category_costs = data_for_chart.map { |cost| cost[1] }
    @total_categories_cost = @category_costs.sum
  end

  def report_by_dates
    #date_start = params[:date_start]
    #date_end = params[:date_end]
    #@operations = Operation.where(odate: date_start..date_end)

    category_totals = Category.joins(:operations)
          .group(:id)
          .select('categories.*, SUM(operations.amount) AS total_cost')
    
    data_for_chart = category_totals.map { |category| [category.name, category.total_cost] }
    @category_names = data_for_chart.map { |name| name[0] }
    @category_costs = data_for_chart.map { |cost| cost[1] }
  end
end
