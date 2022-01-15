require 'test_helper'

class FactContactsControllerTest < ActionDispatch::IntegrationTest
  setup { @fact_contact = fact_contacts(:one) }

  test 'should get index' do
    get fact_contacts_url
    assert_response :success
  end

  test 'should get new' do
    get new_fact_contact_url
    assert_response :success
  end

  test 'should create fact_contact' do
    assert_difference('FactContact.count') { post fact_contacts_url, params: { fact_contact: {} } }

    assert_redirected_to fact_contact_url(FactContact.last)
  end

  test 'should show fact_contact' do
    get fact_contact_url(@fact_contact)
    assert_response :success
  end

  test 'should get edit' do
    get edit_fact_contact_url(@fact_contact)
    assert_response :success
  end

  test 'should update fact_contact' do
    patch fact_contact_url(@fact_contact), params: { fact_contact: {} }
    assert_redirected_to fact_contact_url(@fact_contact)
  end

  test 'should destroy fact_contact' do
    assert_difference('FactContact.count', -1) { delete fact_contact_url(@fact_contact) }

    assert_redirected_to fact_contacts_url
  end
end
