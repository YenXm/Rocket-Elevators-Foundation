# frozen_string_literal: true

require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup { @quote = quotes(:one) }

  test 'visiting the index' do
    visit quotes_url
    assert_selector 'h1', text: 'Quotes'
  end

  test 'creating a Quote' do
    visit quotes_url
    click_on 'New Quote'

    fill_in 'Amount elevators', with: @quote.amount_elevators
    fill_in 'Building type', with: @quote.building_type
    fill_in 'Installation fees', with: @quote.installation_fees
    fill_in 'Product line', with: @quote.product_line
    fill_in 'Total cost', with: @quote.total_cost
    click_on 'Create Quote'

    assert_text 'Quote was successfully created'
    click_on 'Back'
  end

  test 'updating a Quote' do
    visit quotes_url
    click_on 'Edit', match: :first

    fill_in 'Amount elevators', with: @quote.amount_elevators
    fill_in 'Building type', with: @quote.building_type
    fill_in 'Installation fees', with: @quote.installation_fees
    fill_in 'Product line', with: @quote.product_line
    fill_in 'Total cost', with: @quote.total_cost
    click_on 'Update Quote'

    assert_text 'Quote was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Quote' do
    visit quotes_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Quote was successfully destroyed'
  end
end
