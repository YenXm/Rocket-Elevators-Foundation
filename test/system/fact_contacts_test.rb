require 'application_system_test_case'

class FactContactsTest < ApplicationSystemTestCase
  setup { @fact_contact = fact_contacts(:one) }

  test 'visiting the index' do
    visit fact_contacts_url
    assert_selector 'h1', text: 'Fact Contacts'
  end

  test 'creating a Fact contact' do
    visit fact_contacts_url
    click_on 'New Fact Contact'

    click_on 'Create Fact contact'

    assert_text 'Fact contact was successfully created'
    click_on 'Back'
  end

  test 'updating a Fact contact' do
    visit fact_contacts_url
    click_on 'Edit', match: :first

    click_on 'Update Fact contact'

    assert_text 'Fact contact was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Fact contact' do
    visit fact_contacts_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Fact contact was successfully destroyed'
  end
end
