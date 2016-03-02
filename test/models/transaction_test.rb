require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "wallet balance" do
    assert_equal 20.00, Transaction.balance
  end

  test "total transactions" do
    assert_equal 2, Transaction.total_transactions    
  end
end
