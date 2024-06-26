require "test_helper"

class StockEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_entry = stock_entries(:one)
  end

  test "should get index" do
    get stock_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_entry_url
    assert_response :success
  end

  test "should create stock_entry" do
    assert_difference("StockEntry.count") do
      post stock_entries_url, params: { stock_entry: { location: @stock_entry.location, quantity: @stock_entry.quantity } }
    end

    assert_redirected_to stock_entry_url(StockEntry.last)
  end

  test "should show stock_entry" do
    get stock_entry_url(@stock_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_entry_url(@stock_entry)
    assert_response :success
  end

  test "should update stock_entry" do
    patch stock_entry_url(@stock_entry), params: { stock_entry: { location: @stock_entry.location, quantity: @stock_entry.quantity } }
    assert_redirected_to stock_entry_url(@stock_entry)
  end

  test "should destroy stock_entry" do
    assert_difference("StockEntry.count", -1) do
      delete stock_entry_url(@stock_entry)
    end

    assert_redirected_to stock_entries_url
  end
end
