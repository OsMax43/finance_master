require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get report_by_category" do
    get reports_report_by_category_url, params: {s_date: "2023-01-01", e_date: "2023-02-28", otype: "видаток", category_id: "2"}
    assert_response :success
  end

  test "should get report_by_dates" do
    get reports_report_by_dates_url, params: {s_date: "2023-01-01", e_date: "2023-02-28", otype: "видаток", category_id: "3"}
    assert_response :success
  end
  
    
end
