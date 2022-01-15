require 'application_system_test_case'

class FactQuotesTest < ApplicationSystemTestCase
  setup { @fact_quote = fact_quotes(:one) }

  test 'visiting the index' do
    visit fact_quotes_url
    assert_selector 'h1', text: 'Fact Quotes'
  end

  test 'creating a Fact quote' do
    visit fact_quotes_url
    click_on 'New Fact Quote'

    click_on 'Create Fact quote'

    assert_text 'Fact quote was successfully created'
    click_on 'Back'
  end

  test 'updating a Fact quote' do
    visit fact_quotes_url
    click_on 'Edit', match: :first

    click_on 'Update Fact quote'

    assert_text 'Fact quote was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Fact quote' do
    visit fact_quotes_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Fact quote was successfully destroyed'
  end
end
