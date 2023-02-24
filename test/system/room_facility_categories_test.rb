require "application_system_test_case"

class RoomFacilityCategoriesTest < ApplicationSystemTestCase
  setup do
    @room_facility_category = room_facility_categories(:one)
  end

  test "visiting the index" do
    visit room_facility_categories_url
    assert_selector "h1", text: "Room facility categories"
  end

  test "should create room facility category" do
    visit room_facility_categories_url
    click_on "New room facility category"

    click_on "Create Room facility category"

    assert_text "Room facility category was successfully created"
    click_on "Back"
  end

  test "should update Room facility category" do
    visit room_facility_category_url(@room_facility_category)
    click_on "Edit this room facility category", match: :first

    click_on "Update Room facility category"

    assert_text "Room facility category was successfully updated"
    click_on "Back"
  end

  test "should destroy Room facility category" do
    visit room_facility_category_url(@room_facility_category)
    click_on "Destroy this room facility category", match: :first

    assert_text "Room facility category was successfully destroyed"
  end
end
