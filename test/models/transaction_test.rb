require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "get wallet balance" do
    assert_equal 20.00, Transaction.balance
  end
end
