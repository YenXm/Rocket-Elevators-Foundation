require 'application_system_test_case'

class BuildingDetailsTest < ApplicationSystemTestCase
  setup { @building_detail = building_details(:one) }

  test 'visiting the index' do
    visit building_details_url
    assert_selector 'h1', text: 'Building Details'
  end

  test 'creating a Building detail' do
    visit building_details_url
    click_on 'New Building Detail'

    fill_in 'Building', with: @building_detail.building_id
    fill_in 'Information key', with: @building_detail.information_key
    fill_in 'Value', with: @building_detail.value
    click_on 'Create Building detail'

    assert_text 'Building detail was successfully created'
    click_on 'Back'
  end

  test 'updating a Building detail' do
    visit building_details_url
    click_on 'Edit', match: :first

    fill_in 'Building', with: @building_detail.building_id
    fill_in 'Information key', with: @building_detail.information_key
    fill_in 'Value', with: @building_detail.value
    click_on 'Update Building detail'

    assert_text 'Building detail was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Building detail' do
    visit building_details_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Building detail was successfully destroyed'
  end
end
