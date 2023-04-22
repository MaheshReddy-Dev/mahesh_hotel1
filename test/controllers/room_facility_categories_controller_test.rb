# frozen_string_literal: true

require 'test_helper'

class RoomFacilityCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_facility_category = room_facility_categories(:one)
  end

  test 'should get index' do
    get room_facility_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_room_facility_category_url
    assert_response :success
  end

  test 'should create room_facility_category' do
    assert_difference('RoomFacilityCategory.count') do
      post room_facility_categories_url, params: { room_facility_category: {} }
    end

    assert_redirected_to room_facility_category_url(RoomFacilityCategory.last)
  end

  test 'should show room_facility_category' do
    get room_facility_category_url(@room_facility_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_room_facility_category_url(@room_facility_category)
    assert_response :success
  end

  test 'should update room_facility_category' do
    patch room_facility_category_url(@room_facility_category), params: { room_facility_category: {} }
    assert_redirected_to room_facility_category_url(@room_facility_category)
  end

  test 'should destroy room_facility_category' do
    assert_difference('RoomFacilityCategory.count', -1) do
      delete room_facility_category_url(@room_facility_category)
    end

    assert_redirected_to room_facility_categories_url
  end
end
