class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    @cat = Category.find(params[:category_id])
  end

  def report_by_dates
  end
end
