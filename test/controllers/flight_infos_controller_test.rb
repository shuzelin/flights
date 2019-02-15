require 'test_helper'

class FlightInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight_info = flight_infos(:one)
  end

  test "should get index" do
    get flight_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_flight_info_url
    assert_response :success
  end

  test "should create flight_info" do
    assert_difference('FlightInfo.count') do
      post flight_infos_url, params: { flight_info: { airline_id: @flight_info.airline_id, filght_number: @flight_info.filght_number, from_city: @flight_info.from_city, sched: @flight_info.sched, to_city: @flight_info.to_city } }
    end

    assert_redirected_to flight_info_url(FlightInfo.last)
  end

  test "should show flight_info" do
    get flight_info_url(@flight_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_flight_info_url(@flight_info)
    assert_response :success
  end

  test "should update flight_info" do
    patch flight_info_url(@flight_info), params: { flight_info: { airline_id: @flight_info.airline_id, filght_number: @flight_info.filght_number, from_city: @flight_info.from_city, sched: @flight_info.sched, to_city: @flight_info.to_city } }
    assert_redirected_to flight_info_url(@flight_info)
  end

  test "should destroy flight_info" do
    assert_difference('FlightInfo.count', -1) do
      delete flight_info_url(@flight_info)
    end

    assert_redirected_to flight_infos_url
  end
end
