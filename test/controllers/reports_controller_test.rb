require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest

  test "Index for reports" do
    get reports_index_url
    assert_equal("index", @controller.action_name)
  end

  test "Render report_by_category if report_type: category " do
    get reports_report_url, params: {
          report_type: "category"
        }
    assert_template("report_by_category", @controller.action_name)
  end

  test "Render report_by_dates if report_type: dates" do
    get reports_report_url, params: {
          report_type: "dates"
        }
    assert_template("report_by_dates", @controller.action_name)
  end

  test "Select 1 month for category report" do
    date_start = 30.days.ago.beginning_of_day
    date_end = Time.current.end_of_day

    get reports_report_url, params: { 
          report_type: "category",
           date_start: date_start,
             date_end: date_end 
          }

    assert_response :success
    assert_template :report_by_category
  end


end
