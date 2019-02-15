require "application_system_test_case"

class FlightInfosTest < ApplicationSystemTestCase
  setup do
    @flight_info = flight_infos(:one)
  end

  test "visiting the index" do
    visit flight_infos_url
    assert_selector "h1", text: "Flight Infos"
  end

  test "creating a Flight info" do
    visit flight_infos_url
    click_on "New Flight Info"

    fill_in "Airline", with: @flight_info.airline_id
    fill_in "Filght Number", with: @flight_info.filght_number
    fill_in "From City", with: @flight_info.from_city
    fill_in "Sched", with: @flight_info.sched
    fill_in "To City", with: @flight_info.to_city
    click_on "Create Flight info"

    assert_text "Flight info was successfully created"
    click_on "Back"
  end

  test "updating a Flight info" do
    visit flight_infos_url
    click_on "Edit", match: :first

    fill_in "Airline", with: @flight_info.airline_id
    fill_in "Filght Number", with: @flight_info.filght_number
    fill_in "From City", with: @flight_info.from_city
    fill_in "Sched", with: @flight_info.sched
    fill_in "To City", with: @flight_info.to_city
    click_on "Update Flight info"

    assert_text "Flight info was successfully updated"
    click_on "Back"
  end

  test "destroying a Flight info" do
    visit flight_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flight info was successfully destroyed"
  end
end
