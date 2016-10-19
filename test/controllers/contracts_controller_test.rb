require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_url
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post contracts_url, params: { contract: { cost: @contract.cost, description: @contract.description, dev_agree: @contract.dev_agree, dev_corner_id: @contract.dev_corner_id, end_date: @contract.end_date, name: @contract.name, profile_id: @contract.profile_id, start_date: @contract.start_date, user_agree: @contract.user_agree } }
    end

    assert_redirected_to contract_url(Contract.last)
  end

  test "should show contract" do
    get contract_url(@contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_url(@contract)
    assert_response :success
  end

  test "should update contract" do
    patch contract_url(@contract), params: { contract: { cost: @contract.cost, description: @contract.description, dev_agree: @contract.dev_agree, dev_corner_id: @contract.dev_corner_id, end_date: @contract.end_date, name: @contract.name, profile_id: @contract.profile_id, start_date: @contract.start_date, user_agree: @contract.user_agree } }
    assert_redirected_to contract_url(@contract)
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete contract_url(@contract)
    end

    assert_redirected_to contracts_url
  end
end
