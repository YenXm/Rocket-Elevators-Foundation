require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup { @address = addresses(:one) }

  test 'should get index' do
    get addresses_url
    assert_response :success
  end

  test 'should get new' do
    get new_address_url
    assert_response :success
  end

  test 'should create address' do
    assert_difference('Address.count') do
      post addresses_url,
           params: {
             address: {
               city: @address.city,
               country: @address.country,
               entity: @address.entity,
               notes: @address.notes,
               number_and_street: @address.number_and_street,
               postal_code: @address.postal_code,
               status: @address.status,
               suite_or_apartment: @address.suite_or_apartment,
               type_of_address: @address.type_of_address
             }
           }
    end

    assert_redirected_to address_url(Address.last)
  end

  test 'should show address' do
    get address_url(@address)
    assert_response :success
  end

  test 'should get edit' do
    get edit_address_url(@address)
    assert_response :success
  end

  test 'should update address' do
    patch address_url(@address),
          params: {
            address: {
              city: @address.city,
              country: @address.country,
              entity: @address.entity,
              notes: @address.notes,
              number_and_street: @address.number_and_street,
              postal_code: @address.postal_code,
              status: @address.status,
              suite_or_apartment: @address.suite_or_apartment,
              type_of_address: @address.type_of_address
            }
          }
    assert_redirected_to address_url(@address)
  end

  test 'should destroy address' do
    assert_difference('Address.count', -1) { delete address_url(@address) }

    assert_redirected_to addresses_url
  end
end
